import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/api/interface/i_pagination_request.dart';

part 'game_screenshot_request.g.dart';

@JsonSerializable()
class GameScreenshotRequest extends Equatable implements IPaginationRequest {
  @JsonKey(includeToJson: false)
  final int gameId;

  @override
  final int page;

  @override
  @JsonKey(name: "page_size")
  final int pageSize;

  const GameScreenshotRequest({
    required this.gameId,
    required this.page,
    required this.pageSize,
  });

  @override
  Map<String, dynamic> toJson() => _$GameScreenshotRequestToJson(this);

  @override
  List<Object> get props => [gameId, page, pageSize];
}
