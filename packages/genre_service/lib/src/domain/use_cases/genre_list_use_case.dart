import 'package:core/core.dart';

import '../entities/list_response_entity.dart';
import '../repositories/repository.dart';

class GenreListUseCase
    extends UseCase<Failure, GenreListResponseEntity, NoParams> {
  GenreListUseCase({required this.genreRepository});

  final GenreRepository genreRepository;

  @override
  Future<Either<Failure, GenreListResponseEntity>> call(NoParams params) {
    return genreRepository.getGenreList();
  }
}
