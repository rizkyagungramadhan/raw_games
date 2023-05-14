import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/repository/game/model/game_detail/genre_response.dart';

void main() {
  group('Validate GenreResponse object', () {
    test('fromJson should return GenreResponse instance', () {
      // Arrange
      final Map<String, dynamic> json = {
        'id': 1,
        'name': 'Action',
      };

      // Act
      final result = GenreResponse.fromJson(json);

      // Assert
      expect(result, isA<GenreResponse>());
      expect(result.id, 1);
      expect(result.name, 'Action');
    });
  });
}
