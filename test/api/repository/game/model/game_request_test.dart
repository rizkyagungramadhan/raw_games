import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/repository/game/model/game_request.dart';

void main() {
  group('Validate GameRequest object', () {
    test('toJson() returns a valid JSON object with all fields', () {
      final gameRequest = GameRequest(
        page: 2,
        pageSize: 20,
        platforms: '3,4,5',
        searchKeyword: 'zelda',
      );

      final json = gameRequest.toJson();

      expect(json['page'], 2);
      expect(json['page_size'], 20);
      expect(json['platforms'], '3,4,5');
      expect(json['search'], 'zelda');
    });

    test('toJson() returns a valid JSON object with default values', () {
      final gameRequest = GameRequest();

      final json = gameRequest.toJson();

      expect(json['page'], 1);
      expect(json['page_size'], 10);
      expect(json['platforms'], '187');
      expect(json['search'], isNull);
    });
  });
}
