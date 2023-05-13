import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/api/repository/game/model/game_detail/developer_response.dart';
import 'package:raw_games/api/repository/game/model/game_detail/genre_response.dart';
import 'package:raw_games/api/repository/game/model/game_detail/publisher_response.dart';
import 'package:raw_games/api/repository/game/model/i_game_response.dart';
import 'package:raw_games/api/repository/game/model/platform_wrapper.dart';

part 'game_detail_response.g.dart';

@JsonSerializable()
class GameDetailResponse extends IGameResponse {
  @JsonKey(name: "description_raw")
  final String description;

  @JsonKey(name: "released")
  final DateTime releaseDate;

  final String? website;

  @JsonKey(name: "metacritic_url")
  final String? metacriticUrl;

  final List<DeveloperResponse> developers;

  final List<GenreResponse> genres;

  final List<PublisherResponse> publishers;

  GameDetailResponse(
    int id,
    String name,
    List<PlatformWrapper> platforms,
    num? metacriticScore,
    String imageUrl,
    double rating,
    this.description,
    this.releaseDate,
    this.website,
    this.metacriticUrl,
    this.developers,
    this.genres,
    this.publishers,
  ) : super(id, name, platforms, metacriticScore, imageUrl, rating);

  factory GameDetailResponse.fromJson(Map<String, dynamic> json) {
    return _$GameDetailResponseFromJson(json);
  }
}
