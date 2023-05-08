import 'package:json_annotation/json_annotation.dart';

part 'response_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseList<T> {
  final int? count;
  final List<T> results;
  final dynamic error;

  ResponseList(this.count, this.results, this.error);

  factory ResponseList.fromJson(
    dynamic response,
    T Function(Object? json) fromJsonT,
  ) {
    return _$ResponseListFromJson(response, fromJsonT);
  }
}
