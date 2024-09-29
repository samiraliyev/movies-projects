import 'dart:developer';
import 'dart:io';

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:localization/localization.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart' show PrettyDioLogger;
import 'package:rxdart/subjects.dart';

import 'token_storage.dart';

final sessionExpired = BehaviorSubject<bool>();
typedef TokenPair = ({String accessToken, String refreshToken});

class AuthInterceptor extends QueuedInterceptor {
  /// Create an Auth interceptor
  AuthInterceptor({
    required this.tokenStorage,
    required this.localizationDataSource,
    required this.dio,
  });

  final TokenStorage tokenStorage;
  final LocalizationDataSource localizationDataSource;
  final Dio dio;

  /// Async cache that ensures that only one request is made to the storage
  /// simultaneously.
  // final AsyncCache<TokenPair?> _tokenCache = AsyncCache.ephemeral();

  /// Get the token pair
  ///
  /// Returns the cached token pair if it exists,
  /// otherwise loads from the storage.
  Future<({String accessToken, String refreshToken})?> getTokenPair() async {
    return tokenStorage.loadTokenPair();
  }

  Future<String?> getTemporaryToken() async {
    return tokenStorage.loadTemporaryToken();
  }

  /// Clear the token pair
  /// Invalidates cache and clears storage
  @visibleForTesting
  Future<void> clearTokenPair() => tokenStorage.clearTokenPair();

  /// Save the token pair
  /// Invalidates cache and saves to storage
  @visibleForTesting
  Future<void> saveTokenPair({
    required String accessToken,
    required String refreshToken,
  }) async {
    await tokenStorage.saveTokenPair(
      (
        accessToken: accessToken,
        refreshToken: refreshToken,
      ),
    );
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // Load the token pair
      final tokenPair = await getTokenPair();

      final currentLocale = localizationDataSource.locale ?? 'az';

      options.headers['Content-Language'] = currentLocale;

      options.headers['app-name'] = 'movies-project';
      options.headers['User-Agent'] = 'HttpClient';
      options.headers['x-api-version'] = '1.0.0';
      options.headers['x-rapidapi-host'] = 'moviesdatabase.p.rapidapi.com';
      options.headers['x-rapidapi-key'] =
          'dea8f474b3msh2242e2fbb523417p10211cjsn0732729851cd';
      // options.headers['x-app-id'] = '8f83d0d7-59dd-43ec-83a8-e56040aea4b5';
      final requestUrl = options.path;

      final isTemporaryUrl =
          Endpoints.temporaryTokenEndpoints.contains(requestUrl);
      final isNotExcludeUrl = !Endpoints.excludeEndpoints.contains(requestUrl);
      log('requestUrl : $requestUrl');
      log("temporaryTokenEndpoints${Endpoints.temporaryTokenEndpoints}");
      log('isTemporaryUrl : $isTemporaryUrl');
      log('isNotExcludeUrl : $isNotExcludeUrl');
      if (isTemporaryUrl) {
        final tokenTemporary = await tokenStorage.loadTemporaryToken();
        log("tokenTemporary : $tokenTemporary");
        if (tokenTemporary != null) {
          options.headers['Authorization'] = tokenTemporary;
        }
      }
      if (isNotExcludeUrl) {
        final accessToken = tokenPair?.accessToken;
        // final refreshToken = tokenPair?.refreshToken;
        log('accessToken : $accessToken');
        debugPrint('accessToken : $accessToken');

        if (accessToken != null) {
          options.headers['Authorization'] = accessToken;
        }
      }

      // Continue the request
      handler.next(options);
    } on Object {
      // We don't create a new exception here, just rethrow the original
      rethrow;
    }
  }

  @override
  Future<void> onResponse(
    Response<Object?> response,
    ResponseInterceptorHandler handler,
  ) async {
    final shouldRefreshValue = shouldRefresh(response);
    log('onResponse shouldRefreshValue : $shouldRefreshValue');
    final isExcludeEndpoints =
        Endpoints.excludeEndpoints.contains(response.requestOptions.path);
    log('isExcludeEndpoints: $isExcludeEndpoints');
    if (!shouldRefreshValue || isExcludeEndpoints) {
      return handler.next(response);
    }

    try {
      log("refreshResponse: _retry");
      final refreshResponse = await _retry(response.requestOptions);
      handler.resolve(refreshResponse);
    } on DioException catch (error) {
      log("refreshResponse: _retry error");
      handler.reject(error);
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      final token = await getTokenPair();
      final shouldRefreshValue = shouldRefresh(err.response);
      log('onError shouldRefreshValue : $shouldRefreshValue');
      if (!shouldRefreshValue) {
        return handler.next(err);
      }

      final newTokenPair = await _refresh(token);

      log("shouldRefreshValue: onError: $newTokenPair");

      if (newTokenPair != null) {
        final previousRequest = await _retry(err.requestOptions);
        log("shouldRefreshValue: newTokenPair: $newTokenPair");
        handler.resolve(previousRequest);
      } else {
        log("shouldRefreshValue: newTokenPair: error $newTokenPair");
        sessionExpired.add(true);
        handler.reject(err);
      }
    } on DioException catch (error) {
      log("getTokenPair: catch");
      handler.reject(error);
    }
  }

  /// Check if the token pair should be refreshed
  @visibleForTesting
  @pragma('vm:prefer-inline')
  bool shouldRefresh<R>(Response<R>? response) =>
      [403, 401].contains(response?.statusCode);

  Future<TokenPair?> _refresh(TokenPair? tokenPair) async {
    if (tokenPair == null) return null;

    late final TokenPair newTokenPair;

    try {
      final refreshDio = Dio();

      refreshDio.options = BaseOptions(
        baseUrl: dio.options.baseUrl,
        headers: {
          'refresh-Token': tokenPair.refreshToken,
        },
      );

      refreshDio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final securityContext = SecurityContext(); //1
          final client = HttpClient(context: securityContext);

          // final client = HttpClient(
          //   context: SecurityContext(
          //     withTrustedRoots: false,
          //   ),
          // );

          client.badCertificateCallback = (cert, host, port) => true;
          // client.findProxy = (url) => 'PROXY 192.168.167.168:8080';
          return client;
        },
        validateCertificate: (certificate, host, port) {
          if (certificate == null) {
            return true;
          }

          return true;
          // return true;
        },
      );

      final response = await refreshDio.put(
        EndpointExt.path(Endpoints.refresh),
        data: {
          'refreshToken': tokenPair.refreshToken,
        },
      );

      log('refreshDio: $response');
      log('refreshDio: ${response.statusCode}');

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! <= 299) {
        newTokenPair = (
          accessToken: response.data['data']['accessToken'],
          refreshToken: response.data['data']['refreshToken'],
        );

        await tokenStorage.clearTokenPair();
        await tokenStorage.saveTokenPair(newTokenPair);

        return newTokenPair;
      }

      return null;
    } on Object catch (e, stack) {
      // await clearTokenPair();
      log('_refresh: $e, $stack');
      return null;
    }
  }

  Future<Response<R>> _retry<R>(
    RequestOptions requestOptions,
  ) async {
    final retryClient = Dio();
    retryClient.options = BaseOptions(baseUrl: dio.options.baseUrl);

    retryClient.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        request: true,
      ),
    );

    retryClient.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient(
          context: SecurityContext(
            withTrustedRoots: false,
          ),
        );

        client.badCertificateCallback = (cert, host, port) => true;
        // client.findProxy = (url) => 'PROXY 192.168.167.168:8080';
        return client;
      },
      validateCertificate: (certificate, host, port) {
        if (certificate == null) {
          return true;
        }
        return true;
      },
    );

    final tokenPair = await getTokenPair();

    return retryClient.request<R>(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data is FormData
          ? (requestOptions.data as FormData) //.clone()
          : requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        sendTimeout: requestOptions.sendTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
        extra: requestOptions.extra,
        headers: requestOptions.headers
          ..addAll(
            {
              'Accept-Language': localizationDataSource.locale ?? 'en',
              'Authorization': 'Bearer ${tokenPair!.accessToken}',
            },
          ),
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
        validateStatus: requestOptions.validateStatus,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        followRedirects: requestOptions.followRedirects,
        maxRedirects: requestOptions.maxRedirects,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        listFormat: requestOptions.listFormat,
      ),
    );
  }
}
