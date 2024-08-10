import 'package:equatable/equatable.dart';

class PaginationState<Error, T, Extra> extends Equatable {
  final int page;
  final int lastPage;
  final bool isSuccess;
  final bool isEmpty;
  final bool isInProgress;
  final bool isPaginationInProgress;
  final bool isPaginationFailure;
  final bool isFailure;
  final bool isInternetError;
  final T? success;
  final Error? error;
  final Extra? extra;
  final int? totalLength;
  final bool hasMore;
  final bool hasReachedToEnd;

  const PaginationState({
    this.page = 0,
    this.lastPage = 0,
    this.isSuccess = false,
    this.isEmpty = false,
    this.isInProgress = false,
    this.isPaginationInProgress = false,
    this.isPaginationFailure = false,
    this.isFailure = false,
    this.isInternetError = false,
    this.hasReachedToEnd = false,
    this.success,
    this.error,
    this.extra,
    this.totalLength,
    this.hasMore = true,
  });

  PaginationState<Error, T, Extra> copyWith({
    final int? page,
    final bool? hasMore,
    final int? lastPage,
    final bool? isSuccess,
    final bool? isEmpty,
    final bool? isInProgress,
    final bool? isPaginationInProgress,
    final bool? isPaginationFailure,
    final bool? hasReachedToEnd,
    final bool? isFailure,
    final bool? isInternetError,
    final T? success,
    final Error? error,
    final Extra? extra,
    final int? totalLength,
  }) {
    return PaginationState(
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      lastPage: lastPage ?? this.lastPage,
      isSuccess: isSuccess ?? this.isSuccess,
      isEmpty: isEmpty ?? this.isEmpty,
      isPaginationInProgress:
          isPaginationInProgress ?? this.isPaginationInProgress,
      hasReachedToEnd: hasReachedToEnd ?? this.hasReachedToEnd,
      isInProgress: isInProgress ?? this.isInProgress,
      isFailure: isFailure ?? this.isFailure,
      isInternetError: isInternetError ?? this.isInternetError,
      success: success ?? this.success,
      error: error ?? this.error,
      extra: extra ?? this.extra,
      totalLength: totalLength ?? this.totalLength,
    );
  }

  PaginationState<Error, T, Extra> inProgressHandle({
    int? page,
  }) {
    return PaginationState(
      page: page ?? this.page,
      hasReachedToEnd: hasReachedToEnd,
      isSuccess: false,
      isEmpty: false,
      isInProgress: true,
      isPaginationInProgress: false,
      isFailure: false,
      isInternetError: false,
      success: null,
      error: null,
      extra: extra,
      totalLength: totalLength,
    );
  }

  PaginationState<Error, T, Extra> paginationInProgressHandle() {
    return PaginationState(
      page: page,
      hasReachedToEnd: hasReachedToEnd,
      isSuccess: true,
      isEmpty: isEmpty,
      isInProgress: false,
      isPaginationInProgress: true,
      isFailure: false,
      isInternetError: false,
      success: success,
      error: null,
      extra: extra,
      totalLength: totalLength,
    );
  }

  PaginationState<Error, T, Extra> successHandle({
    required T success,
    final int? page,
    final bool? hasReachedToEnd,
    final bool? isEmpty,
  }) {
    return PaginationState(
      page: page ?? this.page,
      hasReachedToEnd: hasReachedToEnd ?? this.hasReachedToEnd,
      isSuccess: true,
      isEmpty: isEmpty ?? this.hasReachedToEnd,
      isInProgress: false,
      isPaginationInProgress: false,
      isFailure: false,
      isInternetError: false,
      success: success,
      error: null,
      extra: extra,
      totalLength: totalLength,
    );
  }

  PaginationState<Error, T, Extra> errorHandle({Error? error}) {
    return PaginationState(
      page: page,
      hasReachedToEnd: hasReachedToEnd,
      isSuccess: false,
      isEmpty: false,
      isInProgress: false,
      isPaginationInProgress: false,
      isFailure: true,
      isInternetError: false,
      success: null,
      error: error,
      extra: extra,
      totalLength: totalLength,
    );
  }

  @override
  List<Object?> get props {
    return [
      page,
      hasMore,
      lastPage,
      isSuccess,
      isEmpty,
      isInProgress,
      isFailure,
      isInternetError,
      hasReachedToEnd,
      isPaginationInProgress,
      isPaginationFailure,
      success,
      error,
      extra,
      totalLength,
    ];
  }
}
