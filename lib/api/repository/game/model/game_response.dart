import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/api/repository/game/model/platform_wrapper.dart';
import 'package:raw_games/utils/style/app_color.dart';

part 'game_response.g.dart';

@JsonSerializable()
class GameResponse {
  final int id;
  final String name;
  @JsonKey(name: "background_image")
  final String imageUrl;
  final double rating;
  @JsonKey(name: "metacritic")
  final num? metacriticScore;
  final List<PlatformWrapper> platforms;

  GameResponse(
    this.id,
    this.name,
    this.imageUrl,
    this.rating,
    this.metacriticScore,
    this.platforms,
  );

  factory GameResponse.fromJson(Map<String, dynamic> json) {
    return _$GameResponseFromJson(json);
  }

  Color get scoreColor {
    if ((metacriticScore ?? 0) < 70) {
      return AppColor.yellow;
    }

    return AppColor.green;
  }

  Set<IconData> get platformIcons {
    if (platforms.isEmpty) return <IconData>{};

    return platforms
        .where((p) => p.platform.iconData is IconData)
        .map((p) => p.platform.iconData!)
        .toSet();
  }
}
