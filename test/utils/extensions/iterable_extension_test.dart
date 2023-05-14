import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/extensions/iterable_extension.dart';

void main() {
  group('Validate IterableExtension', () {
    test('Validate firstWhereOrNull() functionality', () {
      var list = [1, 2, 3, 4, 5];
      var found = list.firstWhereOrNull((element) => element == 3);
      expect(found, equals(3));

      found = list.firstWhereOrNull((element) => element == 6);
      expect(found, isNull);

      list = [];
      found = list.firstWhereOrNull((element) => element == 1);
      expect(found, isNull);
    });
  });
}