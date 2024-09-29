import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genre_service/genre_service.dart';

import 'data_sources.dart';

/// Our Logic for the repositories

/// GenreRepository
final genreRepositoryProvider = Provider<GenreRepository>((ref) {
  return GenreRepositoryImpl(
    genreRemoteDataSource: ref.watch(genreRemoteDataSourceProvider),
  );
});
