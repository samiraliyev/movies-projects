import 'package:core/core.dart';

import '../entities/list_response_entity.dart';

abstract class GenreRepository {
  Future<Either<Failure<ErrorResponseEntity>, GenreListResponseEntity>>
      getGenreList();
}
