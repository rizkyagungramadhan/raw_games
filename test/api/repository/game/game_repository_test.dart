import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:raw_games/api/interface/response_list.dart';
import 'package:raw_games/api/repository/game/game_repository.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_request.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_response.dart';
import 'package:raw_games/api/repository/game/model/game_request.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';

import '../../../mock/mock_data.dart';
import '../../../mock/mocks.dart';
import '../../../mock/mocks.mocks.dart';

void main() {
  late MockGameRepository mockRepository;

  group('GameRepository', () {
    setUpAll(() {
      initMockDependencies();
      mockRepository =
          serviceLocatorTest<GameRepository>() as MockGameRepository;
    });

    test('getListOfGames returns a ResponseList<GameResponse>', () async {
      final request = GameRequest(page: 1, pageSize: 10);
      final expectedResponse = ResponseList<GameResponse>(
        1,
        [GameResponse(1, 'Game 1', [], null, '', 0)],
        null,
      );

      when(mockRepository.getListOfGames(request)).thenAnswer(
        (_) => Future.value(expectedResponse),
      );

      final response = await mockRepository.getListOfGames(request);

      expect(response, expectedResponse);
    });

    test('getDetail returns a GameDetailResponse', () async {
      const gameId = 1;
      final expectedResponse = mockGameDetailResponse();

      when(mockRepository.getDetail(gameId: gameId)).thenAnswer(
        (_) => Future.value(expectedResponse),
      );

      final response = await mockRepository.getDetail(gameId: gameId);

      expect(response, expectedResponse);
    });

    test('getScreenshots returns a ResponseList<GameScreenshotResponse>',
        () async {
      final request = GameScreenshotRequest(gameId: 1, page: 1, pageSize: 10);
      final expectedResponse = ResponseList<GameScreenshotResponse>(
        1,
        [GameScreenshotResponse(1, '', 720, 1080)],
        null,
      );

      when(mockRepository.getScreenshots(request)).thenAnswer(
        (_) => Future.value(expectedResponse),
      );

      final response = await mockRepository.getScreenshots(request);

      expect(response, expectedResponse);
    });
  });
}
