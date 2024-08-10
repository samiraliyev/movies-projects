base class BaseException<T> implements Exception {
  const BaseException([this.error]);

  final T? error;
}

final class CacheException<T> extends BaseException<T> {
  const CacheException([T? error]) : super(error);
}

final class NotFoundException<T> extends BaseException<T> {
  const NotFoundException([T? error]) : super(error);
}

final class InternetException<T> extends BaseException<T> {
  const InternetException([T? error]) : super(error);
}

final class UnauthorizedException<T> extends BaseException<T> {
  const UnauthorizedException([T? error]) : super(error);
}

final class InternalServerException<T> extends BaseException<T> {
  const InternalServerException([T? error]) : super(error);
}

final class BadRequestException<T> extends BaseException<T> {
  const BadRequestException([T? error]) : super(error);
}

final class OtherException<T> extends BaseException<T> {
  const OtherException([T? error]) : super(error);
}

final class PlatformErrorException<T> extends BaseException<T> {
  const PlatformErrorException([T? error]) : super(error);
}
