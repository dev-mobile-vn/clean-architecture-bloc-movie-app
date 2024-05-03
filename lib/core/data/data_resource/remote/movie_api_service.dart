import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/core/network/movie_provider.dart';
import 'package:retrofit/http.dart';

import '../../model/movie_model.dart';
import '../../model/response/movie_response.dart';
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
}

MovieResponse deserializeMovieResponse(Map<String, dynamic> json) => MovieResponse.fromJson(json);

MovieModel? deserializeMovieModel(Map<String, dynamic> json) => MovieModel.fromJson(json);
