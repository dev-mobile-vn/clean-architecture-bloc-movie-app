import 'package:movie_app/core/data/data_resource/remote/movie/movie_api_service.dart';
import 'package:movie_app/core/data/model/request/query_request.dart';
import 'package:movie_app/core/data/model/response/movie_response.dart';
import 'package:movie_app/features/movies/domain/repository/movies_repository.dart';
import 'package:dio/dio.dart';

class ListMovieRepositoryImpl extends ListMovieRepository {
  final MovieApiService _service;

  ListMovieRepositoryImpl(this._service);

  @override
  Future<MovieResponse> getListMovies(QueryRequest query) async {
    try {
      return await _service.getListMovies(query.lang, query.page, query.path, query.id);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
