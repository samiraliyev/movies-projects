import 'dart:developer';

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:genre_service/src/domain/entities/list_response_entity.dart';

import '../../domain/repositories/repository.dart';
import '../data_sources/remote_data_source.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreRemoteDataSource genreRemoteDataSource;

  GenreRepositoryImpl({required this.genreRemoteDataSource});

  @override
  Future<Either<Failure<ErrorResponseEntity>, GenreListResponseEntity>>
      getGenreList() async {
    try {
      final result = await genreRemoteDataSource.getGenreList();

      // analyticsService.logSuccessfulLogin();
      return Right(result);
    } on DioException catch (e, stacktrace) {
      log('error: $e, stacktrace: $stacktrace');

      switch (e.error.runtimeType) {
        case const (UnauthorizedException):
          return Left(const Failure.unauthorized());
        case const (InternetException):
          return Left(const Failure.noInternet());
        default:
          {
            final error = e.error;
            if (error is BaseException && error.error is Map<String, dynamic>) {
              return Left(
                Failure<ErrorResponseEntity>.internalServer(
                  ErrorResponseModel.fromJson(error.error),
                ),
              );
            }
          }
      }

      return Left(const Failure.other());
    } catch (e, stacktrace) {
      log("stacktrace: $stacktrace");
      return Left(const Failure.other());
    }
  }
}
