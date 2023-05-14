import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/repository/game/model/platform_response.dart';
import 'package:raw_games/common/const/platform_type.dart';

void main() {
  group('Validate PlatformResponse object', () {
    test('fromJson creates PlatformResponse object with correct values', () {
      final Map<String, dynamic> json = {
        'id': 4,
        'name': 'PC (Microsoft Windows)',
        'slug': 'pc',
      };

      final platform = PlatformResponse.fromJson(json);

      expect(platform.id, equals(4));
      expect(platform.name, equals('PC (Microsoft Windows)'));
      expect(platform.slug, equals('pc'));
    });

    test('iconData returns correct IconData', () {
      final platform = PlatformResponse(4, 'PC (Microsoft Windows)', 'pc');

      expect(platform.iconData, equals(PlatformType.pc.iconData));
    });

    test('iconData returns null if slug is null', () {
      final platform = PlatformResponse(4, 'PC (Microsoft Windows)', null);

      expect(platform.iconData, equals(null));
    });

    test('iconData returns null if slug is not a valid PlatformType', () {
      final platform =
          PlatformResponse(4, 'PC (Microsoft Windows)', 'not_a_valid_slug');

      expect(platform.iconData, equals(null));
    });
  });
}
