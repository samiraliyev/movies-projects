import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection/riverpod/notifiers.dart';
import '../widgets/genre_data_content_widget.dart';

class GenreListPage extends ConsumerStatefulWidget {
  const GenreListPage({super.key});

  @override
  ConsumerState<GenreListPage> createState() => _GenreListPageState();
}

class _GenreListPageState extends ConsumerState<GenreListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(genreListNotifierProvider.notifier).getDataList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genre List'),
      ),
      body: const GenreDataContentWidget(),
    );
  }
}
