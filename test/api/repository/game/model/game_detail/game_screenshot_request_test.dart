import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/interface/i_pagination_request.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_request.dart';

void main() {
  group('Validate GameScreenshotRequest object', () {
    test('toJson() should return the correct map', () {
      // Arrange
      final request = GameScreenshotRequest(gameId: 1, page: 1, pageSize: 20);

      // Act
      final result = request.toJson();

      // Assert
      expect(request, isA<IPaginationRequest>());
      expect(
        result,
        equals({
          'page': 1,
          'page_size': 20,
        }),
      );
    });
  });
}
