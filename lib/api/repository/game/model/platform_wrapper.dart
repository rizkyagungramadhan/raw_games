import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/api/repository/game/model/platform_response.dart';

part 'platform_wrapper.g.dart';

@JsonSerializable()
class PlatformWrapper {
  final PlatformResponse platform;

  PlatformWrapper(this.platform);

  factory PlatformWrapper.fromJson(Map<String, dynamic> json) {
    return _$PlatformWrapperFromJson(json);
  }
}
