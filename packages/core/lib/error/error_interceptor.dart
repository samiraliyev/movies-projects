import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../error/exceptions.dart';

final class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('ErrorInterceptor: onError: $err');
    log('ErrorInterceptor: onError: ${err.error}');
    log('ErrorInterceptor: headers: ${err.requestOptions.headers}');
    if (err.error is SocketException) {
      throw const InternetException();
    } else if (err.response != null) {
      log('ErrorInterceptor ${err.response!.statusCode}');
      log('ErrorInterceptor ${err.response!.data}');
      if (err.response!.statusCode == 500) {
        throw InternalServerException(err.response!.data);
      } else if (err.response!.statusCode == 409) {
        throw InternalServerException(err.response?.data);
      } else if (err.response!.statusCode == 404) {
        log('handler.next(err) ErrorInterceptor value = ${404}');
        // throw const NotFoundException();
        throw NotFoundException(err.response?.data);
      } else if (err.response!.statusCode == 401) {
        throw const UnauthorizedException();
      } else if (err.response!.statusCode == 403) {
        throw const UnauthorizedException();
      } else if (err.response!.statusCode == 400) {
        throw BadRequestException(err.response!.data);
      } else {
        throw const OtherException();
      }
    } else {
      throw const OtherException();
    }
  }
}
