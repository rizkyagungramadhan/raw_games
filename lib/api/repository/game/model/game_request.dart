import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/api/interface/i_pagination_request.dart';

part 'game_request.g.dart';

@JsonSerializable()
class GameRequest extends Equatable implements IPaginationRequest {
  @override
  final int page;

  @override
  @JsonKey(name: "page_size")
  final int pageSize;

  final String platforms;

  @JsonKey(name: "search")
  final String? searchKeyword;

  const GameRequest({
    this.page = 1,
    this.pageSize = 10,
    this.platforms = '187',
    this.searchKeyword,
  });

  @override
  Map<String, dynamic> toJson() => _$GameRequestToJson(this);

  @override
  List<Object?> get props => [page, pageSize, platforms, searchKeyword];
}
