import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:movie_app/core/data/model/response/movie_response.dart';
import 'package:movie_app/core/network/movie_provider.dart';
import 'package:movie_app/features/movie_detail/data/model/review_model.dart';
import 'package:movie_app/features/movie_detail/data/model/trailer_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';
part 'movie_api_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class MovieApiService {
  factory MovieApiService(MovieProvider provider) =>
      _MovieApiService(provider.dio);

  @GET('now_playing')
  Future<MovieResponse> getMoviesNowPlaying(
      @Query('language') String lang, @Query('page') int page);

  @GET('popular')
  Future<MovieResponse> getMoviesPopular(
      @Query('language') String lang, @Query('page') int page);

  @GET('search/movie')
  Future<MovieResponse> searchMovies(
      @Query('query') String query,
      @Query('include_adult') bool includeAdult,
      @Query('language') String lang,
      @Query('page') int page);

  @GET('top_rated')
  Future<MovieResponse> getMoviesTopRate(
      @Query('language') String lang, @Query('page') int page);

  @GET('{id}/{path}')
  Future<MovieResponse> getListMovies(@Query('language') String lang,
      @Query('page') int page, @Path() String path, @Path() String id);

  @GET('{id}?language=en-US')
  Future<MovieModel?> getMovieDetail(@Path() String id);

  @GET('{id}/reviews')
  Future<ReviewsResponse> getReviewsMovie(@Path() String id);

  @GET('{id}/videos?language=en-US')
  Future<TrailerResponse> getTrailerMovie(@Path() String id);
}

MovieResponse deserializeMovieResponse(Map<String, dynamic> json) =>
    MovieResponse.fromJson(json);

MovieModel? deserializeMovieModel(Map<String, dynamic> json) =>
    MovieModel.fromJson(json);

ReviewsResponse deserializeReviewsResponse(Map<String, dynamic> json) =>
    ReviewsResponse.fromJson(json);

TrailerResponse deserializeTrailerResponse(Map<String, dynamic> json) =>
    TrailerResponse.fromJson(json);
