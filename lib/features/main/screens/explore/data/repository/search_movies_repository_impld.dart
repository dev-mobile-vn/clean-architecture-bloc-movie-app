import 'package:movie_app/core/data/data_resource/remote/movie/search_movie_api_service.dart';
import 'package:movie_app/core/data/model/request/search_query.dart';
import 'package:movie_app/core/data/model/response/movie_response.dart';
import 'package:movie_app/features/main/screens/explore/domain/repository/search_movies_repository.dart';
import 'package:dio/dio.dart';


class SearchMoviesRepositoryImpl extends SearchMoviesRepository {
  final SearchMovieApiService _service;

  SearchMoviesRepositoryImpl(this._service);
  @override
  Future<MovieResponse> searchMoviesMovies(SearchQuery query) async{
    try {
      return await _service.searchMovies(
          query.query, query.includeAdult, query.lang, query.page);
    } on DioException catch (_) {
      rethrow;
    }
  }

}