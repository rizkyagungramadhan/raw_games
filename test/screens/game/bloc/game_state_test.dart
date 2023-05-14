import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_response.dart';
import 'package:raw_games/screens/game/bloc/game_bloc.dart';
import 'package:raw_games/screens/game/const/game_screen_const.dart';

import '../../../mock/mock_data.dart';

void main() {
  group('Validate GameState object', () {
    const isLoading = false;
    final item = mockGameDetailResponse();
    const error = 'Test Error';
    final screenshots = [
      GameScreenshotResponse(1, 'screenshot1.png', 1111, 1212),
      GameScreenshotResponse(2, 'screenshot2.png', 1111, 1212)
    ];
    const screenshotPage = 1;
    const isLastScreenshotPage = true;
    const getScreenshotError = 'Test Get Screenshot Error';

    test('props returns correct list of properties', () {
      final state = GameState(
        isLoading: isLoading,
        item: item,
        error: error,
        screenshots: screenshots,
        screenshotPage: screenshotPage,
        isLastScreenshotPage: isLastScreenshotPage,
        getScreenshotError: getScreenshotError,
      );

      expect(state.props, [
        isLoading,
        item,
        error,
        screenshots,
        screenshotPage,
        isLastScreenshotPage,
        getScreenshotError,
      ]);
    });

    test('copyWith returns correct object', () {
      final state = GameState(
        isLoading: isLoading,
        item: item,
        error: error,
        screenshots: screenshots,
        screenshotPage: screenshotPage,
        isLastScreenshotPage: isLastScreenshotPage,
        getScreenshotError: getScreenshotError,
      );
      final newState = state.copyWith(
        isLoading: true,
        item: null,
        error: null,
        screenshots: null,
        screenshotPage: null,
        isLastScreenshotPage: false,
        getScreenshotError: null,
      );

      expect(newState.isLoading, isTrue);
      expect(newState.error, isNull);
      expect(newState.screenshots, isNull);
      expect(newState.screenshotPage, GameScreenConst.firstScreenshotPageKey);
      expect(newState.isLastScreenshotPage, isFalse);
      expect(newState.getScreenshotError, isNull);
    });
  });
}
