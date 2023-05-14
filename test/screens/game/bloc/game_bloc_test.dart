import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:raw_games/api/interface/response_list.dart';
import 'package:raw_games/api/repository/game/game_repository.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_request.dart';
import 'package:raw_games/screens/game/bloc/game_bloc.dart';
import 'package:raw_games/screens/game/const/game_screen_const.dart';
import 'package:raw_games/utils/router/app_router.dart';
import 'package:raw_games/utils/router/route.dart';

// ignore_for_file: depend_on_referenced_packages
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import '../../../mock/mock_data.dart';
import '../../../mock/mock_url_launcher.dart';
import '../../../mock/mocks.dart';
import '../../../mock/mocks.mocks.dart';

void main() {
  late MockAppRouter mockAppRouter;
  late MockGameRepository mockGameRepository;
  late MockUrlLauncher mockUrlLauncher;
  const gameId = 132;
  const mockUrl = 'https://any.com';

  final mockDetailResponse = mockGameDetailResponse();
  final mockScreenshotsResponse = [mockGameScreenshot, mockGameScreenshot];
  const screenShotRequest = GameScreenshotRequest(
    gameId: gameId,
    page: GameScreenConst.firstScreenshotPageKey,
    pageSize: GameScreenConst.fetchScreenshotPerPage,
  );

  setUpAll(() {
    initMockDependencies();

    mockAppRouter = serviceLocatorTest<AppRouter>() as MockAppRouter;
    mockGameRepository =
        serviceLocatorTest<GameRepository>() as MockGameRepository;
    mockUrlLauncher = MockUrlLauncher();
    mockLaunchUrlExpectation(
      mockUrlLauncher,
      mockUrl,
    );
    UrlLauncherPlatform.instance = mockUrlLauncher;
  });

  group('Validate fetchDetail functionality', () {
    blocTest<GameBloc, GameState>('validate state when success',
        setUp: () async {
          when(mockGameRepository.getDetail(gameId: gameId))
              .thenAnswer((_) async => mockDetailResponse);

          when(
            mockGameRepository.getScreenshots(screenShotRequest),
          ).thenAnswer(
            (_) async => ResponseList(
                mockScreenshotsResponse.length, mockScreenshotsResponse, null),
          );
        },
        build: () => GameBloc(),
        act: (bloc) {
          bloc.add(const FetchDetailEvent(gameId));
        },
        expect: () => <GameState>[
              const GameState(isLoading: true, error: null),
              GameState(
                  isLoading: false, error: null, item: mockDetailResponse),
              // taking screenshot state
              GameState(
                isLoading: false,
                error: null,
                item: mockDetailResponse,
                screenshots: mockScreenshotsResponse,
                isLastScreenshotPage: mockScreenshotsResponse.length <
                    GameScreenConst.fetchScreenshotPerPage,
                screenshotPage: GameScreenConst.firstScreenshotPageKey,
                getScreenshotError: null,
              ),
            ],
        verify: (_) {
          verifyInOrder([
            mockGameRepository.getDetail(gameId: gameId),
            mockGameRepository.getScreenshots(screenShotRequest),
          ]);
        });

    blocTest<GameBloc, GameState>('validate state when error',
        setUp: () async {
          when(mockGameRepository.getDetail(gameId: gameId))
              .thenThrow(mockError);
        },
        build: () => GameBloc(),
        act: (bloc) {
          bloc.add(const FetchDetailEvent(gameId));
        },
        expect: () => <GameState>[
              const GameState(isLoading: true, error: null),
              GameState(
                isLoading: false,
                error: mockError,
                item: null,
              ),
            ],
        verify: (_) {
          verify(mockGameRepository.getDetail(gameId: gameId));
          verifyNever(mockGameRepository.getScreenshots(screenShotRequest));
        });
  });

  group('Validate fetchScreenshots functionality', () {
    blocTest<GameBloc, GameState>('validate state when success',
        setUp: () async {
          when(
            mockGameRepository.getScreenshots(screenShotRequest),
          ).thenAnswer(
            (_) async => ResponseList(
                mockScreenshotsResponse.length, mockScreenshotsResponse, null),
          );
        },
        build: () => GameBloc(),
        act: (bloc) {
          bloc.add(const FetchScreenshotEvent(gameId: gameId));
        },
        expect: () => <GameState>[
              const GameState(),
              GameState(
                isLoading: false,
                error: null,
                item: null,
                screenshots: mockScreenshotsResponse,
                isLastScreenshotPage: mockScreenshotsResponse.length <
                    GameScreenConst.fetchScreenshotPerPage,
                screenshotPage: GameScreenConst.firstScreenshotPageKey,
                getScreenshotError: null,
              )
            ],
        verify: (_) {
          verify(mockGameRepository.getScreenshots(screenShotRequest));
        });

    blocTest<GameBloc, GameState>('validate state when error',
        setUp: () async {
          when(mockGameRepository.getScreenshots(screenShotRequest))
              .thenThrow(mockError);
        },
        build: () => GameBloc(),
        act: (bloc) {
          bloc.add(const FetchScreenshotEvent(gameId: gameId));
        },
        expect: () => <GameState>[
              const GameState(),
              GameState(
                isLoading: false,
                error: null,
                item: null,
                screenshots: null,
                isLastScreenshotPage: false,
                screenshotPage: null,
                getScreenshotError: mockError,
              )
            ],
        verify: (_) {
          verify(mockGameRepository.getScreenshots(screenShotRequest));
        });
  });

  group('Validate openImageDetail functionality', () {
    blocTest<GameBloc, GameState>(
      'validate state when success',
      setUp: () async {
        when(mockAppRouter.rootNavigateTo(Routes.gallery, mockGameScreenshot))
            .thenAnswer((_) => Future.value());
      },
      build: () => GameBloc(),
      act: (bloc) {
        bloc.add(OpenDetailImageEvent(mockGameScreenshot));
      },
      verify: (_) {
        verify(
            mockAppRouter.rootNavigateTo(Routes.gallery, mockGameScreenshot));
      },
    );
  });

  group('Validate openUrlOnBrowser functionality', () {
    blocTest<GameBloc, GameState>('validate when success called',
        build: () => GameBloc(),
        act: (bloc) {
          bloc.add(const OpenBrowserEvent(mockUrl));
        },
        verify: (_) {
          expect(mockUrlLauncher.launchCalled, isTrue);
        });
  });
}
