import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raw_games/utils/style/app_color.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: AppColor.primary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColor.primary,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColor.primary,
    canvasColor: Colors.transparent,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.accent,
      primary: AppColor.primary,
      background: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
