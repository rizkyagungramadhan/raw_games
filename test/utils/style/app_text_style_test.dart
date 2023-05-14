import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';

void main() {
  group('Validate AppTextStyle', () {
    test('light should return a light text style', () {
      final textStyle = AppTextStyle.light();

      expect(textStyle.decoration, equals(TextDecoration.none));
      expect(textStyle.fontSize, equals(AppDimen.fontMedium));
      expect(textStyle.wordSpacing, equals(0.1));
      expect(textStyle.color, equals(Colors.black38));
      expect(textStyle.fontFamily, equals('Poppins'));
      expect(textStyle.fontWeight, equals(FontWeight.w300));
    });

    test('regular should return a regular text style', () {
      final textStyle = AppTextStyle.regular();

      expect(textStyle.decoration, equals(TextDecoration.none));
      expect(textStyle.fontSize, equals(AppDimen.fontMedium));
      expect(textStyle.color, equals(Colors.black54));
      expect(textStyle.fontFamily, equals('Poppins'));
      expect(textStyle.fontWeight, equals(FontWeight.w500));
    });

    test('bold should return a bold text style', () {
      final textStyle = AppTextStyle.bold();

      expect(textStyle.decoration, equals(TextDecoration.none));
      expect(textStyle.fontSize, equals(AppDimen.fontMedium));
      expect(textStyle.color, equals(Colors.black87));
      expect(textStyle.fontFamily, equals('Poppins'));
      expect(textStyle.fontWeight, equals(FontWeight.w700));
    });

    test('light should support custom parameters', () {
      final textStyle = AppTextStyle.light(
        color: Colors.red,
        size: AppDimen.fontLarge,
        isUnderlined: true,
        fontWeight: FontWeight.w500,
      );

      expect(textStyle.decoration, equals(TextDecoration.underline));
      expect(textStyle.fontSize, equals(AppDimen.fontLarge));
      expect(textStyle.color, equals(Colors.red));
      expect(textStyle.fontWeight, equals(FontWeight.w500));
    });

    test('regular should support custom parameters', () {
      final textStyle = AppTextStyle.regular(
        color: Colors.green,
        size: AppDimen.fontExtraLarge,
        isUnderlined: true,
      );

      expect(textStyle.decoration, equals(TextDecoration.underline));
      expect(textStyle.fontSize, equals(AppDimen.fontExtraLarge));
      expect(textStyle.color, equals(Colors.green));
    });

    test('bold should support custom parameters', () {
      final textStyle = AppTextStyle.bold(
        color: Colors.blue,
        size: AppDimen.fontSmall,
        isUnderlined: true,
      );

      expect(textStyle.decoration, equals(TextDecoration.underline));
      expect(textStyle.fontSize, equals(AppDimen.fontSmall));
      expect(textStyle.color, equals(Colors.blue));
    });
  });
}
