import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';

void main() {
  group('Validate GameResponse object', () {
    test('fromJson() should return a valid GameResponse object', () {
      final json = {
        'id': 123,
        'name': 'My Game',
        'platforms': [],
        'metacritic': 80,
        'background_image': 'https://example.com/image.jpg',
        'rating': 8.5,
      };

      final response = GameResponse.fromJson(json);

      expect(response.id, equals(123));
      expect(response.name, equals('My Game'));
      expect(response.platforms, isEmpty);
      expect(response.metacriticScore, equals(80));
      expect(response.imageUrl, equals('https://example.com/image.jpg'));
      expect(response.rating, equals(8.5));
    });
  });
}
