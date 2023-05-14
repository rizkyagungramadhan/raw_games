import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/router/route_info.dart';

void main() {
  test('Validate RouteInfo should have the correct argument', () {
    const argument = 'test';
    final routeInfo = RouteInfo(argument: argument);
    expect(routeInfo.argument, equals(argument));
  });
}
