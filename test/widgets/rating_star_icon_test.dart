import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/widgets/rating_star_icon.dart';

import '../test_utils/test_utils.dart';

void main() {
  group('Validate RatingStarIcon widget', () {
    testWidgets('RatingStarIcon should hide rating number',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        buildTestableWidget(
          child: const RatingStarIcon(
            rating: 3.5,
            showRatingNumber: false,
          ),
        ),
      );

      // Assert
      expect(find.text('(3.5)'), findsNothing);
    });

    testWidgets('RatingStarIcon displays correct rating and stars',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        buildTestableWidget(
          child: const RatingStarIcon(rating: 3.5),
        ),
      );

      // Assert
      // Verify that RatingStarIcon displays 5 stars, 3 full, 1 half, and 1 empty
      expect(find.byIcon(Icons.star), findsNWidgets(3));
      expect(find.byIcon(Icons.star_half), findsOneWidget);
      expect(find.byIcon(Icons.star_border), findsOneWidget);

      // Verify that RatingStarIcon displays the correct rating value
      expect(find.text('(3.5)'), findsOneWidget);

      // Verify that the size of the stars is correct
      final icons =
          tester.widgetList(find.byType(Icon)).map((widget) => widget as Icon);
      expect(
          icons.every((icon) => icon.size == AppDimen.sizeIconLarge), isTrue);
    });
  });
}
