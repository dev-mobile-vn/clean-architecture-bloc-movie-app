import 'package:movie_app/core/data/data_resource/remote/movie/movie_api_service.dart';
import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:movie_app/features/movie_detail/data/model/review_model.dart';
import 'package:movie_app/features/movie_detail/data/model/trailer_model.dart';
import 'package:movie_app/features/movie_detail/domain/repository/movie_detail_repository.dart';
import 'package:dio/dio.dart';

class MovieDetailRepositoryImpl extends MovieDetailRepository {
  final MovieApiService _service;

  MovieDetailRepositoryImpl(this._service);

  @override
  Future<MovieModel?> getMovieDetail(String id) async {
    try {
      return await _service.getMovieDetail(id);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<ReviewsResponse> getReviewsMovie(String id) async {
    try {
      return await _service.getReviewsMovie(id);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<TrailerResponse> getTrailerMovie(String id) async {
    try {
      return await _service.getTrailerMovie(id);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
