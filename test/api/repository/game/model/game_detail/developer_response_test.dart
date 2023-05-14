import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/repository/game/model/game_detail/developer_response.dart';

void main() {
  group('Validate DeveloperResponse object', () {
    test('fromJson() should return a valid model', () {
      final Map<String, dynamic> json = {
        'id': 123,
        'name': 'John Doe',
      };

      final model = DeveloperResponse.fromJson(json);

      expect(model.id, equals(123));
      expect(model.name, equals('John Doe'));
    });

    // test('toJson() should return a JSON map with correct values', () {
    //   final model = DeveloperResponse(123, 'John Doe');
    //
    //   final json = model.toJson();
    //
    //   expect(json['id'], equals(123));
    //   expect(json['name'], equals('John Doe'));
    // });
  });
}
