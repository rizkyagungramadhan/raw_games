import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:raw_games/common/const/platform_type.dart';
import 'package:raw_games/utils/extensions/iterable_extension.dart';

part 'platform_response.g.dart';

@JsonSerializable()
class PlatformResponse {
  final int? id;
  final String? name;
  final String? slug;

  PlatformResponse(this.id, this.name, this.slug);

  factory PlatformResponse.fromJson(Map<String, dynamic> json) {
    return _$PlatformResponseFromJson(json);
  }

  IconData? get iconData {
    if (slug is! String) return null;

    final platformSlug = slug ?? '';

    return PlatformType.values
        .firstWhereOrNull((type) {
          return type.slug == platformSlug;
        })
        ?.iconData;
  }
}
