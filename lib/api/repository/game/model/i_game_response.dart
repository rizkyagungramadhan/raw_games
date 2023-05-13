import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/api/repository/game/model/platform_wrapper.dart';
import 'package:raw_games/utils/style/app_color.dart';

abstract class IGameResponse {
  final int id;

  final String name;

  final List<PlatformWrapper> platforms;

  @JsonKey(name: "metacritic")
  final num? metacriticScore;

  @JsonKey(name: "background_image")
  final String imageUrl;

  final double rating;

  IGameResponse(
    this.id,
    this.name,
    this.platforms,
    this.metacriticScore,
    this.imageUrl,
    this.rating,
  );

  Set<IconData> get platformIcons {
    if (platforms.isEmpty) return <IconData>{};

    return platforms
        .where((p) => p.platform.iconData is IconData)
        .map((p) => p.platform.iconData!)
        .toSet();
  }

  Color get scoreColor {
    if ((metacriticScore ?? 0) < 70) {
      return AppColor.yellow;
    }

    return AppColor.green;
  }
}
