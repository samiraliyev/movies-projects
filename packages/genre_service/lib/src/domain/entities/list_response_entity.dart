class GenreListResponseEntity {
  final List<String>? results;

  GenreListResponseEntity({
    this.results,
  });

  GenreListResponseEntity copyWith({
    List<String>? results,
  }) =>
      GenreListResponseEntity(
        results: results ?? this.results,
      );
}
