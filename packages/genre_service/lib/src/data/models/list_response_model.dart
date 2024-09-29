// To parse this JSON data, do
//
//     final genreListResponseModel = genreListResponseModelFromMap(jsonString);

import 'dart:convert';

import '../../domain/entities/list_response_entity.dart';

GenreListResponseModel genreListResponseModelFromMap(String str) =>
    GenreListResponseModel.fromMap(json.decode(str));

String genreListResponseModelToMap(GenreListResponseModel data) =>
    json.encode(data.toMap());

class GenreListResponseModel extends GenreListResponseEntity {
  GenreListResponseModel({
    super.results,
  });

  factory GenreListResponseModel.fromMap(Map<String, dynamic> json) =>
      GenreListResponseModel(
        results: json["results"] == null
            ? []
            : List<String>.from(json["results"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "results":
            results == null ? [] : List<dynamic>.from(results!.map((x) => x)),
      };
}
