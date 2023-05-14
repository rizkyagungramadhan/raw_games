import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/common/exception/app_exception.dart';
import 'package:raw_games/common/exception/response_exception.dart';

void main() {
  test('Validate ResponseException class', () {
    // Arrange
    const mockMessage = 'error';
    final stub = ResponseException(mockMessage);

    // Assert
    expect(stub, isA<Exception>());
    expect(stub, isA<AppException>());
    expect(stub.message, mockMessage);
    expect(stub.toString(), equals(mockMessage));
  });
}