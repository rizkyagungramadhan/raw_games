import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/api/interface/i_pagination_request.dart';

part 'game_request.g.dart';

@JsonSerializable()
class GameRequest implements IPaginationRequest {
  @override
  int page;

  @override
  @JsonKey(name: "page_size")
  int pageSize;

  String platforms;

  GameRequest({this.page = 1, this.pageSize = 10, this.platforms = '187'});

  @override
  Map<String, dynamic> toJson() => _$GameRequestToJson(this);
}
