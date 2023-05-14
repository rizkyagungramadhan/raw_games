import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';
import 'package:raw_games/generated/l10n.dart';
import 'package:raw_games/screens/home/section/main/widgets/home_list_card.dart';
import 'package:raw_games/screens/home/section/main/widgets/home_list_view.dart';

import '../../../../../mock/mock_data.dart';
import '../../../../../test_utils/test_utils.dart';

void main() {
  Future<void> initWidget({
    required WidgetTester tester,
    required PagingController<int, GameResponse> pagingController,
  }) async {
    initializeWindowSize(tester);
    return await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: HomeListView(pagingController: pagingController),
        ),
      );

      await tester.pump();
    });
  }

  testWidgets('Validate HomeListView showing all items as List',
      (WidgetTester tester) async {
    // Arrange
    final items = [mockGameResponse(), mockGameResponse()];
    final pagingController = PagingController<int, GameResponse>(
      firstPageKey: 1,
    );
    pagingController.value = PagingState(
      nextPageKey: 1,
      itemList: items,
      error: null,
    );

    // Act
    await initWidget(tester: tester, pagingController: pagingController);

    // Assert
    expect(find.byType(PagedListView<int, GameResponse>), findsOneWidget);
    expect(find.byType(HomeListCard), findsNWidgets(items.length));
  });

  testWidgets('Validate HomeListView showing empty view',
      (WidgetTester tester) async {
    // Arrange
    final pagingController = PagingController<int, GameResponse>(
      firstPageKey: 1,
    );
    pagingController.value = const PagingState(
      nextPageKey: 1,
      itemList: [],
      error: null,
    );

    // Act
    await initWidget(tester: tester, pagingController: pagingController);

    // Assert
    expect(find.byType(PagedListView<int, GameResponse>), findsOneWidget);
    expect(find.byType(HomeListCard), findsNothing);
    expect(find.text(S.current.emptySearchText), findsOneWidget);
  });
}
