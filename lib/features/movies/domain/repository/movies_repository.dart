
import 'package:movie_app/core/data/model/request/query_request.dart';
import 'package:movie_app/core/data/model/response/movie_response.dart';

abstract class ListMovieRepository {
  Future<MovieResponse> getListMovies(QueryRequest query);
}