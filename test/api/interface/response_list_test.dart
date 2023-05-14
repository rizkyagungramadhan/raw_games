import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/interface/response_list.dart';

import '../../mock/mock_data.dart';

final _mockResults = [
  _GenericObj('description1'),
  _GenericObj('description2'),
];

void main() {
  group('Validate ResponseList functionality', () {

    test('Validate ResponseList fromJson function', () {
      // Arrange
      final responseListJson = mockResponseListAsJson(
        results: _mockResults,
        toJsonT: (obj) => obj.toJson(),
        isError: true,
      );

      // Act
      final result = ResponseList.fromJson(
        responseListJson,
        (json) => _GenericObj.fromJson(json as Map<String, dynamic>),
      );

      // Assert
      expect(result, isA<ResponseList>());
      expect(result.results.length, equals(_mockResults.length));
      expect(result.count, equals(_mockResults.length));
      expect(result.error, equals(mockError));
    });

    test('Validate ResponseList toJson function', () {
      // Arrange
      final mockResultJson = _mockResults.map((o) => o.toJson()).toList();
      final responseListInstance =
          mockResponseList(results: _mockResults, isError: true);

      // Act
      final result =
          responseListInstance.toJson((json) => (json as _GenericObj).toJson());

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['count'], equals(_mockResults.length));
      expect(result['error'], equals(mockError));
      expect(result['results'], equals(mockResultJson));
    });
  });
}

class _GenericObj {
  final String description;

  _GenericObj(this.description);

  factory _GenericObj.fromJson(Map<String, dynamic> json) {
    return _GenericObj(json['description'].toString());
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'description': description,
      };
}
