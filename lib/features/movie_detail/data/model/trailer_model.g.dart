// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailerResponse _$TrailerResponseFromJson(Map<String, dynamic> json) =>
    TrailerResponse(
      trailers: (json['results'] as List<dynamic>)
          .map((e) => TrailerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TrailerModel _$TrailerModelFromJson(Map<String, dynamic> json) => TrailerModel(
      name: json['name'] as String,
      key: json['key'] as String,
      id: json['id'] as String,
    );
