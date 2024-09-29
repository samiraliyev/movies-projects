// Our Use Cases for the repositories

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genre_service/genre_service.dart';
import 'package:movie_user_app/injection/riverpod/repositories.dart';

/// GenreListUseCase
final genreListUseCaseProvider = Provider<GenreListUseCase>((ref) {
  return GenreListUseCase(
    genreRepository: ref.watch(genreRepositoryProvider),
  );
});
