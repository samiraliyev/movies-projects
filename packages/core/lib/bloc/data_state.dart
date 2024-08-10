import 'package:equatable/equatable.dart';

class DataState<Error, T, Extra> extends Equatable {
  const DataState({
    this.isInProgress = false,
    this.isFailure = false,
    this.isSuccess = false,
    this.isEmpty = false,
    this.error,
    this.data,
    this.extra,
  });

  final bool isInProgress;
  final bool isFailure;
  final bool isSuccess;
  final bool isEmpty;
  final Error? error;
  final T? data;
  final Extra? extra;

  DataState<Error, T, Extra> copyWith({
    bool? isInProgress,
    bool? isFailure,
    bool? isSuccess,
    bool? isEmpty,
    Error? error,
    T? data,
    Extra? extra,
  }) {
    return DataState<Error, T, Extra>(
      isInProgress: isInProgress ?? false,
      isFailure: isFailure ?? false,
      isSuccess: isSuccess ?? false,
      isEmpty: isEmpty ?? false,
      error: error,
      data: data ?? this.data,
      extra: extra ?? this.extra,
    );
  }

  DataState<Error, T, Extra> inProgressHandle() {
    return DataState(
      isSuccess: false,
      isEmpty: false,
      isInProgress: true,
      isFailure: false,
      error: null,
      extra: extra,
    );
  }

  DataState<Error, T, Extra> successHandle({
    required T? data,
    final bool? hasReachedToEnd,
    final bool? isEmpty,
    final Extra? extra,
  }) {
    return DataState(
      isSuccess: true,
      isEmpty: isEmpty ?? this.isEmpty,
      isInProgress: false,
      isFailure: false,
      data: data,
      error: null,
      extra: extra ?? this.extra,
    );
  }

  DataState<Error, T, Extra> errorHandle({Error? error}) {
    return DataState(
      isSuccess: false,
      isEmpty: false,
      isInProgress: false,
      isFailure: true,
      error: error,
      extra: extra,
    );
  }

  @override
  List<Object?> get props => [
        isInProgress,
        isFailure,
        isSuccess,
        isEmpty,
        error,
        data,
        extra,
      ];
}
