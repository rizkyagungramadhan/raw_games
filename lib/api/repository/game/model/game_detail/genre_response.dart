import 'package:json_annotation/json_annotation.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse {
  final int id;

  final String name;

  GenreResponse(this.id, this.name);

  factory GenreResponse.fromJson(Map<String, dynamic> json) {
    return _$GenreResponseFromJson(json);
  }
}