import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/widgets/adaptive_marquee_text.dart';

import '../test_utils/test_utils.dart';

void main() {
  Future<void> initWidget(WidgetTester tester, String text) async {
    await tester.pumpWidget(
      buildTestableWidget(
        child: AdaptiveMarqueeText(text),
      ),
    );

    await tester.pump();
  }

  testWidgets(
      'AdaptiveMarqueeText should show short text without Marquee effect',
      (WidgetTester tester) async {
    // Arrange
    const text = 'Short text';

    // Act
    await initWidget(tester, text);

    // Assert
    expect(find.text(text), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(ListView), findsNothing);
    expect(find.byType(Align), findsNothing);
  });

  testWidgets('AdaptiveMarqueeText should show long text with Marquee effect',
      (WidgetTester tester) async {
    // Arrange
    const text =
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna';
    // Act
    await initWidget(tester, text);

    // Assert
    expect(find.text(text), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });
}
