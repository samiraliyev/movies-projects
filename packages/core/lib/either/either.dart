import 'package:flutter/foundation.dart';

sealed class Either<E, S> {}

final class Left<E, S> extends Either<E, S> {
  Left(this.error);

  E? error;
}

final class Right<E, S> extends Either<E, S> {
  Right(this.success);

  S? success;
}

@immutable
class Unit {
  const Unit._internal();

  @override
  String toString() => '()';
}

const Unit unit = Unit._internal();
