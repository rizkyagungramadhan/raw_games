import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/generated/l10n.dart';
import 'package:raw_games/screens/game/section/rating_score_section.dart';
import 'package:raw_games/widgets/rating_star_icon.dart';

import '../../../mock/mock_data.dart';
import '../../../test_utils/test_utils.dart';

void main() {
  final item = mockGameDetailResponse();

  testWidgets('RatingScoreSection displays correct rating and score',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        child: RatingScoreSection(item: item),
      ),
    );

    expect(
      find.text(S.current.ratingAndScore),
      findsOneWidget,
    );

    expect(find.byType(RatingStarIcon), findsOneWidget);

    expect(
      find.text(item.metacriticScore.toString()),
      findsOneWidget,
    );
  });
}
