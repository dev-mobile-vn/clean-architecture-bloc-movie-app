import 'package:json_annotation/json_annotation.dart';
part 'trailer_model.g.dart';

@JsonSerializable(createToJson: false)
class TrailerResponse {
  @JsonKey(name: "results")
  List<TrailerModel> trailers;

  TrailerResponse({
    required this.trailers,
  });

  factory TrailerResponse.fromJson(Map<String, dynamic> json) => _$TrailerResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class TrailerModel {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "key")
  String key;
  @JsonKey(name: "id")
  String id;

  TrailerModel({
    required this.name,
    required this.key,
    required this.id,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) => _$TrailerModelFromJson(json);
}
