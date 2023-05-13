import 'package:json_annotation/json_annotation.dart';

part 'game_screenshot_response.g.dart';

@JsonSerializable()
class GameScreenshotResponse {
  final int id;
  @JsonKey(name: "image")
  final String imageUrl;
  final int width;
  final int height;

  GameScreenshotResponse(this.id, this.imageUrl, this.width, this.height);

  factory GameScreenshotResponse.fromJson(Map<String, dynamic> json) {
    return _$GameScreenshotResponseFromJson(json);
  }
}
