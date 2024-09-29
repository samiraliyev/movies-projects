import 'dart:developer';

import 'package:api_service/api_service.dart';
import 'package:core/core.dart';

import '../models/list_response_model.dart';

abstract class GenreRemoteDataSource {
  Future<GenreListResponseModel> getGenreList();
}

class GenreRemoteDataSourceImpl extends GenreRemoteDataSource {
  final ApiService apiService;

  GenreRemoteDataSourceImpl({required this.apiService});

  @override
  Future<GenreListResponseModel> getGenreList() async {
    final response = await apiService.get(
      EndpointExt.path(
        Endpoints.genreList,
      ),
    );

    log("response: ${response.data.runtimeType}");
    log("response: ${response.data}");
    return genreListResponseModelFromMap(response.data);
  }
}
