import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/router/route_definition.dart';

void main() {
  group('Validate RouteDefinition', () {
    test('should have the correct name', () {
      const route = RouteDefinition(name: '/test');
      expect(route.name, equals('/test'));
    });

    test('should be equal if they have the same name', () {
      const route1 = RouteDefinition(name: '/test');
      const route2 = RouteDefinition(name: '/test');
      expect(route1, equals(route2));
    });

    test('should not be equal if they have different names', () {
      const route1 = RouteDefinition(name: '/test1');
      const route2 = RouteDefinition(name: '/test2');
      expect(route1, isNot(equals(route2)));
    });
  });
}