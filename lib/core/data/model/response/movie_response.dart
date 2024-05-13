import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_response.g.dart';

@JsonSerializable(createToJson: false)
class MovieResponse {
  @JsonKey(name: "page")
  final int page;
  @JsonKey(name: "results")
  final List<MovieModel> movies;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);
}
