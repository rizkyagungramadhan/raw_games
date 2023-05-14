import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/generated/l10n.dart';

import '../mock/mock_data.dart';

Widget buildTestableWidget({Widget? child}) {
  return MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      home: Scaffold(body: child),
      locale: mockLocale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    ),
  );
}

Future<void> forcePumpAndSettle({required WidgetTester tester}) async {
  for (var i = 0; i < 5; i++) {
    await tester.pump(const Duration(seconds: 1));
  }
}

void initializeWindowSize(WidgetTester tester) {
  // Based on iPhone SE, resulting in viewport with size: 375x667 logical pixels
  tester.binding.window.physicalSizeTestValue = const Size(750, 1334);
  tester.binding.window.devicePixelRatioTestValue = 1;
}

