import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/api/repository/game/model/i_game_response.dart';
import 'package:raw_games/api/repository/game/model/platform_wrapper.dart';

part 'game_response.g.dart';

@JsonSerializable()
class GameResponse extends IGameResponse {
  GameResponse(
    int id,
    String name,
    List<PlatformWrapper> platforms,
    num? metacriticScore,
    String imageUrl,
    double rating,
  ) : super(id, name, platforms, metacriticScore, imageUrl, rating);

  factory GameResponse.fromJson(Map<String, dynamic> json) {
    return _$GameResponseFromJson(json);
  }
}
