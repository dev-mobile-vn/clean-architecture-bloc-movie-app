import 'package:json_annotation/json_annotation.dart';
part 'review_model.g.dart';

@JsonSerializable(createToJson: false)
class ReviewsResponse {
  @JsonKey(name: "page")
  final int page;
  @JsonKey(name: "results")
  final List<ReviewModel> reviews;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  ReviewsResponse({required this.page, required this.reviews, required this.totalPages, required this.totalResults});

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) => _$ReviewsResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ReviewModel {
  @JsonKey(name: "author")
  String author;
  @JsonKey(name: "author_details")
  AuthorDetail authorDetail;
  @JsonKey(name: "content")
  String content;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "url")
  String url;

  ReviewModel({
    required this.author,
    required this.authorDetail,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);
}

@JsonSerializable()
class AuthorDetail {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "avatar_path")
  String? avatarPath;
  @JsonKey(name: "rating")
  double? rating;

  AuthorDetail({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  factory AuthorDetail.fromJson(Map<String, dynamic> json) => _$AuthorDetailFromJson(json);
}
