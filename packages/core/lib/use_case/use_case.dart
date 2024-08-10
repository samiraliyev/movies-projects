import 'dart:async';

import 'package:equatable/equatable.dart';

import '../either/either.dart';

abstract class UseCase<Error, Success, Params> {
  FutureOr<Either<Error, Success>> call(Params params);
}
abstract class AsyncUsecase<Error, Success, Params> {
  Future<Either<Error, Success>> call(Params params);
}

abstract class Params extends Equatable {
  const Params();

  @override
  List<Object?> get props => [];
}

class NoParams extends Params {}
