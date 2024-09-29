import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/use_cases/genre_list_use_case.dart';

typedef GenreListState = DataState<dynamic, List<String>, dynamic>;

class GenreListNotifier extends StateNotifier<GenreListState> {
  GenreListNotifier({required this.genreListUseCase})
      : super(const GenreListState());

  final GenreListUseCase genreListUseCase;

  Future<void> getDataList() async {
    if (state.isInProgress) return;
    try {
      // if (!mounted) return;

      state = state.inProgressHandle();

      final result = await genreListUseCase.call(NoParams());

      switch (result) {
        case Left(error: var error):
          log(error!.toString(), name: 'GenreListNotifier');
          state = state.errorHandle(error: error);
          break;
        case Right(success: var success):
          {
            final dataList = success!.results!;
            if (dataList.isNotEmpty) {
              // const emptyList = <String>[];

              state = state.successHandle(
                data: dataList,
                isEmpty: dataList.isEmpty,
                hasReachedToEnd: false,
              );
            } else {
              log('String: empty', name: 'GenreListNotifier');

              state = state.successHandle(
                data: <String>[],
                isEmpty: dataList.isEmpty,
                hasReachedToEnd: true,
              );
            }
            break;
          }
      }
    } catch (e, stack) {
      log('error: $e, stacktrace: $stack', name: 'GenreListNotifier');
      // if (mounted) {
      state = state.errorHandle(error: e);
      // state = state.copyWith(isFailure: true, isInProgress: false);
      // }
    }
  }

  addItem(String item) {
    final currentDataList = state.data ?? <String>[];
    final totalDataList = currentDataList..add(item);
    state = state.successHandle(
      data: totalDataList,
      isEmpty: false,
      hasReachedToEnd: false,
    );
  }

  deleteItemById(String id) {
    final currentDataList = state.data ?? <String>[];
    final totalDataList = currentDataList
      ..removeWhere((element) => element == id);
    state = state.successHandle(
      data: totalDataList,
      isEmpty: false,
      hasReachedToEnd: false,
    );
  }
}
