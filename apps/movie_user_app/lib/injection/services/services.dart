
import 'package:api_service/api_service.dart';
import 'package:auth/auth.dart';
import 'package:core/constants/endpoints.dart';
import 'package:core/error/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../riverpod/data_sources.dart';



final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final localAuthProvider = Provider<LocalAuthentication>((ref) {
  return LocalAuthentication();
});

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final tokenStorageProvider = Provider<TokenStorage>(
  (ref) {
    return SecureTokenStorage(
      ref.watch(secureStorageProvider),
    );
  },
);

final dioProvider = Provider<Dio>(
  (ref) {
    // final environment = ref.watch(environmentProvider);
    // Endpoints.environment = environment;

    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: Endpoints.baseUrl,
        // connectTimeout: 60000,
        // receiveTimeout: 60000,
        responseType: ResponseType.json,
        contentType: 'application/json',
      );

    // dio.httpClientAdapter = IOHttpClientAdapter(
    //   createHttpClient: () {
    //     final client = HttpClient(
    //       context: SecurityContext(
    //         withTrustedRoots: false,
    //       ),
    //     );
    //
    //     // client.badCertificateCallback = (cert, host, port) => true;
    //     // client.findProxy = (url) => 'PROXY 192.168.167.168:8080';
    //     return client;
    //   },
    //   validateCertificate: (certificate, host, port) {
    //     if (certificate == null) {
    //       return true;
    //     }
    //
    //     return true;
    //   },
    // );

    final authInterceptor = AuthInterceptor(

      tokenStorage: ref.watch(
        tokenStorageProvider,
      ),
      localizationDataSource: ref.watch(
        localizationDataSourceProvider,
      ),
      dio: dio,
    );

    dio.interceptors.addAll(
      [
        // if (environment != Environment.production)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          request: true,
        ),
        ErrorInterceptor(),
        authInterceptor,
      ],
    );

    return dio;
  },
);

final apiServiceProvider = Provider<ApiService>(
  (ref) {
    return ApiServiceImpl(
      ref.watch(dioProvider),
      baseUrl: Endpoints.baseUrl,
    );
  },
);
