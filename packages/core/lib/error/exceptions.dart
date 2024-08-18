base class BaseException<T> implements Exception {
  const BaseException([this.error]);

  final T? error;
}

final class CacheException<T> extends BaseException<T> {
  const CacheException([super.error]);
}

final class NotFoundException<T> extends BaseException<T> {
  const NotFoundException([super.error]);
}

final class InternetException<T> extends BaseException<T> {
  const InternetException([super.error]);
}

final class UnauthorizedException<T> extends BaseException<T> {
  const UnauthorizedException([super.error]);
}

final class InternalServerException<T> extends BaseException<T> {
  const InternalServerException([super.error]);
}

final class BadRequestException<T> extends BaseException<T> {
  const BadRequestException([super.error]);
}

final class OtherException<T> extends BaseException<T> {
  const OtherException([super.error]);
}

final class PlatformErrorException<T> extends BaseException<T> {
  const PlatformErrorException([super.error]);
}
