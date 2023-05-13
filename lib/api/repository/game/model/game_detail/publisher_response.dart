import 'package:json_annotation/json_annotation.dart';

part 'publisher_response.g.dart';

@JsonSerializable()
class PublisherResponse {
  final int id;

  final String name;

  PublisherResponse(this.id, this.name);

  factory PublisherResponse.fromJson(Map<String, dynamic> json) {
    return _$PublisherResponseFromJson(json);
  }
}
