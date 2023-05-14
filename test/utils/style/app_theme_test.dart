import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/style/app_color.dart';
import 'package:raw_games/utils/style/app_theme.dart';

void main() {
  group('Validate AppTheme', () {
    test('should have correct app bar theme', () {
      final theme = AppTheme.theme;
      expect(theme.appBarTheme.backgroundColor, equals(AppColor.primary));
      expect(theme.appBarTheme.systemOverlayStyle?.statusBarColor,
          equals(Colors.transparent));
      expect(theme.appBarTheme.systemOverlayStyle?.statusBarIconBrightness,
          equals(Brightness.dark));
      expect(theme.appBarTheme.systemOverlayStyle?.statusBarBrightness,
          equals(Brightness.light));
      expect(theme.appBarTheme.systemOverlayStyle?.systemNavigationBarColor,
          equals(Colors.white));
      expect(
          theme.appBarTheme.systemOverlayStyle
              ?.systemNavigationBarIconBrightness,
          equals(Brightness.light));
    });

    test('should have correct primary color', () {
      final theme = AppTheme.theme;
      expect(theme.primaryColor, equals(AppColor.primary));
    });

    test('should have correct canvas color', () {
      final theme = AppTheme.theme;
      expect(theme.canvasColor, equals(Colors.transparent));
    });

    test('should have correct color scheme', () {
      final theme = AppTheme.theme;
      expect(theme.colorScheme.secondary, equals(AppColor.accent));
      expect(theme.colorScheme.primary, equals(AppColor.primary));
      expect(theme.colorScheme.background, equals(Colors.white));
    });

    test('should have correct scaffold background color', () {
      final theme = AppTheme.theme;
      expect(theme.scaffoldBackgroundColor, equals(Colors.white));
    });
  });
}
