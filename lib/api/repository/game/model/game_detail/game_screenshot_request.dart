import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/api/interface/i_pagination_request.dart';

part 'game_screenshot_request.g.dart';

@JsonSerializable()
class GameScreenshotRequest implements IPaginationRequest {
  @JsonKey(includeToJson: false)
  final int gameId;

  @override
  int page;

  @override
  @JsonKey(name: "page_size")
  int pageSize;

  GameScreenshotRequest({
    required this.gameId,
    required this.page,
    required this.pageSize,
  });

  @override
  Map<String, dynamic> toJson() => _$GameScreenshotRequestToJson(this);
}
