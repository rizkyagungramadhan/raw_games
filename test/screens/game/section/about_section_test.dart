import 'package:expandable_text/expandable_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/generated/l10n.dart';
import 'package:raw_games/screens/game/section/about_section.dart';

import '../../../mock/mock_data.dart';
import '../../../test_utils/test_utils.dart';

void main() {
  testWidgets('AboutSection displays genre information',
      (WidgetTester tester) async {
    // Arrange
    final item = mockGameDetailResponse();

    // Act
    await tester.pumpWidget(
      buildTestableWidget(
        child: AboutSection(item: item),
      ),
    );

    // Assert
    expect(find.text(S.current.about), findsOneWidget);
    expect(find.byType(ExpandableText), findsOneWidget);
    expect(find.text(S.current.genre), findsOneWidget);

    for (var genre in item.genres) {
      expect(find.text(genre.name), findsOneWidget);
    }
  });

  testWidgets('AboutSection displays no genres when empty',
      (WidgetTester tester) async {
    // Arrange
    final item = mockGameDetailResponse(withGenre: false);

    // Act
    await tester.pumpWidget(
      buildTestableWidget(
        child: AboutSection(item: item),
      ),
    );

    // Assert
    expect(find.text(S.current.about), findsOneWidget);
    expect(find.byType(ExpandableText), findsOneWidget);
    expect(find.text(S.current.genre), findsNothing);
  });
}
