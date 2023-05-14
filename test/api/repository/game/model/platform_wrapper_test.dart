import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/repository/game/model/platform_wrapper.dart';

void main() {
  test('Validate PlatformWrapper.fromJson returns a valid object', () {
    // Arrange
    final json = {
      'platform': {
        'id': 1,
        'name': 'PlayStation 4',
        'slug': 'playstation4'
      }
    };

    // Act
    final platformWrapper = PlatformWrapper.fromJson(json);

    // Assert
    expect(platformWrapper.platform.id, 1);
    expect(platformWrapper.platform.name, 'PlayStation 4');
    expect(platformWrapper.platform.slug, 'playstation4');
  });
}
