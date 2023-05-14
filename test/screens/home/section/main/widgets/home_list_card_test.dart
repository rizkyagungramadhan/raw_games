import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';
import 'package:raw_games/screens/home/section/main/widgets/home_List_card.dart';

import '../../../../../mock/mock_data.dart';
import '../../../../../test_utils/test_utils.dart';

void main() {
  Future<void> initWidget({
    required WidgetTester tester,
    required GameResponse item,
  }) async {
    initializeWindowSize(tester);
    return await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: HomeListCard(item: item),
        ),
      );

      await tester.pump();
    });
  }

  testWidgets('Validate HomeGridCard should show all correct content',
      (WidgetTester tester) async {
    // Arrange
    final item = mockGameResponse();

    // Act
    await initWidget(tester: tester, item: item);

    // Assert
    expect(find.byType(InkWell), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(
      find.byWidgetPredicate((widget) =>
          widget is Text && widget.data?.contains(item.name) == true),
      findsOneWidget,
    );
    expect(find.byType(Icon), findsWidgets);
    expect(find.text(item.metacriticScore.toString()), findsOneWidget);
  });

  testWidgets(
      'Validate HomeGridCard should hide score & platform icon when it\'s empty',
      (WidgetTester tester) async {
    // Arrange
    final item = mockGameResponse(
      withMetacriticScore: false,
      withPlatform: false,
    );

    // Act
    await initWidget(tester: tester, item: item);

    // Assert
    expect(find.byType(InkWell), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(
      find.byWidgetPredicate((widget) =>
          widget is Text && widget.data?.contains(item.name) == true),
      findsOneWidget,
    );
    expect(find.byType(Icon), findsNothing);
    expect(find.text(item.metacriticScore.toString()), findsNothing);
  });
}
