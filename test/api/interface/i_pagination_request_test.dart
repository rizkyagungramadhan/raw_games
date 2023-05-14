import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/interface/i_pagination_request.dart';

const _mockMap = {'page': 1, 'pageSize': 10};

void main() {
  test('Validate IPaginationRequest interface', () {
    // Arrange
    final stub = _PaginationRequest(1, 10);

    // Act
    final jsonMap = stub.toJson();

    // Assert
    expect(stub, isA<IPaginationRequest>());
    expect(stub.page, 1);
    expect(stub.pageSize, 10);
    expect(jsonMap, equals(_mockMap));

  });
}

class _PaginationRequest implements IPaginationRequest {
  @override
  int page;

  @override
  int pageSize;

  _PaginationRequest(this.page, this.pageSize);

  @override
  Map<String, dynamic> toJson() {
    return _mockMap;
  }
}
