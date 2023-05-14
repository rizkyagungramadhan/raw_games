import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/generated/l10n.dart';
import 'package:raw_games/widgets/pagination_error_view.dart';

import '../test_utils/test_utils.dart';

void main() {
  group('Validate PaginationErrorView widget', () {
    testWidgets('renders text and button', (WidgetTester tester) async {
      // Arrange
      bool isInvoked = false;

      // Act
      await tester.pumpWidget(
        buildTestableWidget(
          child: PaginationErrorView(onRetry: () => isInvoked = true),
        ),
      );

      // Assert
      expect(find.text(S.current.somethingErrorText), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);

      // Tap on the button
      await tester.tap(find.byType(ElevatedButton));
      expect(isInvoked, isTrue);
    });

    testWidgets('renders text only', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        buildTestableWidget(
          child: const PaginationErrorView(onRetry: null),
        ),
      );

      // Assert
      expect(find.text(S.current.somethingErrorText), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNothing);
    });
  });
}
