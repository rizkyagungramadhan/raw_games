import 'package:json_annotation/json_annotation.dart';

part 'developer_response.g.dart';

@JsonSerializable()
class DeveloperResponse {
  final int id;
  final String name;

  DeveloperResponse(this.id, this.name);

  factory DeveloperResponse.fromJson(Map<String, dynamic> json) {
    return _$DeveloperResponseFromJson(json);
  }
}
