import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/api/repository/game/model/game_request.dart';

part 'game_screenshot_request.g.dart';

@JsonSerializable()
class GameScreenshotRequest extends GameRequest {
  @JsonKey(includeToJson: false)
  final int gameId;

  GameScreenshotRequest({
    required this.gameId,
    int page = 1,
    int pageSize = 5,
  }) : super(page: page, pageSize: pageSize, platforms: '');

  @override
  Map<String, dynamic> toJson() => _$GameScreenshotRequestToJson(this);
}
