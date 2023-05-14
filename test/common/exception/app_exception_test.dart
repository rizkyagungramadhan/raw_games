import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/common/exception/app_exception.dart';

void main() {
  test('Validate AppException class', () {
    // Arrange
    const mockMessage = 'error';
    final stub = AppException(mockMessage);

    // Assert
    expect(stub, isA<Exception>());
    expect(stub.message, mockMessage);
    expect(stub.toString(), equals(mockMessage));
  });
}