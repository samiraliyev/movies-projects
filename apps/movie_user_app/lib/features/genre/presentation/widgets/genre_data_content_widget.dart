import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection/riverpod/notifiers.dart';

class GenreDataContentWidget extends ConsumerWidget {
  const GenreDataContentWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final genreListState = ref.watch(genreListNotifierProvider);
    if (genreListState.isInProgress) {
      return const Center(child: CircularProgressIndicator());
    } else if (genreListState.isFailure) {
      return const Center(child: Text('Failed to fetch data'));
    } else if (genreListState.isSuccess) {
      final dataList = genreListState.data;
      if (dataList == null || dataList.isEmpty) {
        return const Center(child: Text('No data found'));
      }
      return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataList[index]),
          );
        },
      );
    }
    return const SizedBox.shrink();
  }
}
