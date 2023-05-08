import 'package:json_annotation/json_annotation.dart';

part 'game_response.g.dart';

@JsonSerializable()
class GameResponse {
  final int id;
  final String name;
  @JsonKey(name: "background_image")
  final String imageUrl;
  final double rating;
  @JsonKey(name: "metacritic")
  final num metacriticScore;

  GameResponse(
    this.id,
    this.name,
    this.imageUrl,
    this.rating,
    this.metacriticScore,
  );

  factory GameResponse.fromJson(Map<String, dynamic> json) {
    return _$GameResponseFromJson(json);
  }
}
