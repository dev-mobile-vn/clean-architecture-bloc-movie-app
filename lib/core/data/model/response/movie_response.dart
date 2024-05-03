import 'package:json_annotation/json_annotation.dart';

import '../movie_model.dart';
part 'movie_response.g.dart';

@JsonSerializable(createToJson: false)
class MovieResponse {
  @JsonKey(name: "page")
  final int page;

  @JsonKey(name: "total_pages")
  final int totalPages;

  @JsonKey(name: "total_results")
  final int totalResults;

  @JsonKey(name: "results")
  final List<MovieModel> movies;

  MovieResponse(
      {required this.page,
      required this.totalPages,
      required this.totalResults,
      required this.movies});

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);
}
