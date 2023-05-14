import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/repository/game/model/game_detail/publisher_response.dart';

void main() {
  group('Validate PublisherResponse object', () {
    test('fromJson() should parse JSON correctly', () {
      final Map<String, dynamic> json = {
        'id': 1,
        'name': 'Publisher 1',
      };

      final publisher = PublisherResponse.fromJson(json);

      expect(publisher.id, equals(1));
      expect(publisher.name, equals('Publisher 1'));
    });
  });
}
