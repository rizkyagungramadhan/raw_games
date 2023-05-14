import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/extensions/string_extension.dart';

void main() {
  group('NullableStringExtension', () {
    test('isNullOrEmpty should return true for null', () {
      const String? nullString = null;
      expect(nullString.isNullOrEmpty, isTrue);
    });

    test('isNullOrEmpty should return true for empty string', () {
      const String emptyString = '';
      expect(emptyString.isNullOrEmpty, isTrue);
    });

    test('isNullOrEmpty should return true for "null" string', () {
      const String nilString = 'null';
      expect(nilString.isNullOrEmpty, isTrue);
    });

    test('isNullOrEmpty should return false for non-null and non-empty string',
        () {
      const String nonNullString = 'Hello';
      expect(nonNullString.isNullOrEmpty, isFalse);
    });

    test('isNotNullOrEmpty should return false for null', () {
      const String? nullString = null;
      expect(nullString.isNotNullOrEmpty, isFalse);
    });

    test('isNotNullOrEmpty should return false for empty string', () {
      const String emptyString = '';
      expect(emptyString.isNotNullOrEmpty, isFalse);
    });

    test('isNotNullOrEmpty should return false for "null" string', () {
      const String nilString = 'null';
      expect(nilString.isNotNullOrEmpty, isFalse);
    });

    test(
        'isNotNullOrEmpty should return true for non-null and non-empty string',
        () {
      const String nonNullString = 'Hello';
      expect(nonNullString.isNotNullOrEmpty, isTrue);
    });

    test('orEmpty should return an empty string for null', () {
      const String? nullString = null;
      expect(nullString.orEmpty, equals(''));
    });

    test(
        'orEmpty should return the original string for non-null and non-"null" string',
        () {
      const String nonNullString = 'Hello';
      expect(nonNullString.orEmpty, equals('Hello'));
    });

    test('orEmpty should return an empty string for "null" string', () {
      const String nilString = 'null';
      expect(nilString.orEmpty, equals(''));
    });
  });
}
