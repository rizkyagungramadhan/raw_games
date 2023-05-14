import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:raw_games/api/interface/response_list.dart';
import 'package:raw_games/api/repository/game/game_repository.dart';
import 'package:raw_games/api/repository/game/model/game_request.dart';
import 'package:raw_games/common/exception/response_exception.dart';
import 'package:raw_games/screens/home/bloc/home_bloc.dart';
import 'package:raw_games/screens/home/const/home_screen_const.dart';
import 'package:raw_games/utils/router/app_router.dart';
import 'package:raw_games/utils/router/route.dart';

import '../../../mock/mock_data.dart';
import '../../../mock/mocks.dart';
import '../../../mock/mocks.mocks.dart';

void main() {
  late MockGameRepository mockGameRepository;
  late MockAppRouter mockAppRouter;

  final mockResponseData = mockGameResponse();
  final mockResults = [mockResponseData, mockResponseData];

  setUpAll(() {
    initMockDependencies();

    mockGameRepository =
        serviceLocatorTest<GameRepository>() as MockGameRepository;
    mockAppRouter = serviceLocatorTest<AppRouter>() as MockAppRouter;
  });

  group('Validate fetchGame functionality', () {
    blocTest<HomeBloc, HomeState>('validate state when success get fresh data',
        setUp: () async {
          when(
            mockGameRepository.getListOfGames(
              const GameRequest(
                page: HomeScreenConst.firstPageKey,
                pageSize: HomeScreenConst.fetchPerPage,
                searchKeyword: null,
              ),
            ),
          ).thenAnswer(
            (_) => Future.value(
              ResponseList(mockResults.length, mockResults, null),
            ),
          );
        },
        build: () => HomeBloc(),
        act: (bloc) {
          bloc.add(const FetchEvent());
        },
        expect: () => <HomeState>[
              const HomeState(error: null, items: null, totalSearchResult: 0),
              HomeState(
                error: null,
                items: mockResults,
                totalSearchResult: mockResults.length,
                page: HomeScreenConst.firstPageKey,
                isLastPage: mockResults.length < HomeScreenConst.fetchPerPage,
              ),
            ],
        verify: (_) {
          verify(
            mockGameRepository.getListOfGames(
              const GameRequest(
                page: HomeScreenConst.firstPageKey,
                pageSize: HomeScreenConst.fetchPerPage,
                searchKeyword: null,
              ),
            ),
          );
        });

    blocTest<HomeBloc, HomeState>(
      'validate state when error encountered',
      setUp: () async {
        when(
          mockGameRepository.getListOfGames(
            const GameRequest(
              page: HomeScreenConst.firstPageKey,
              pageSize: HomeScreenConst.fetchPerPage,
              searchKeyword: null,
            ),
          ),
        ).thenAnswer(
          (_) => Future.value(ResponseList(null, [], mockError)),
        );
      },
      build: () => HomeBloc(),
      act: (bloc) {
        bloc.add(const FetchEvent());
      },
      expect: () {
        return <HomeState>[
          const HomeState(error: null, items: null, totalSearchResult: 0),
          HomeState(
            error: ResponseException(mockError.toString()),
            items: null,
            totalSearchResult: 0,
          ),
        ];
      },
      verify: (_) {
        verify(
          mockGameRepository.getListOfGames(
            const GameRequest(
              page: HomeScreenConst.firstPageKey,
              pageSize: HomeScreenConst.fetchPerPage,
              searchKeyword: null,
            ),
          ),
        );
      },
    );
  });

  group('Validate search functionality', () {
    const searchKeyword = 'searchKeyword';

    blocTest<HomeBloc, HomeState>('validate state when success',
        setUp: () async {
          when(
            mockGameRepository.getListOfGames(
              const GameRequest(
                page: HomeScreenConst.firstPageKey,
                pageSize: HomeScreenConst.fetchPerPage,
                searchKeyword: searchKeyword,
              ),
            ),
          ).thenAnswer(
            (_) => Future.value(
              ResponseList(mockResults.length, mockResults, null),
            ),
          );
        },
        build: () => HomeBloc(),
        act: (bloc) {
          bloc.add(const SearchEvent(keyword: searchKeyword));
        },
        expect: () {
          return <HomeState>[
            const HomeState(
              error: null,
              items: null,
              totalSearchResult: 0,
              keyword: searchKeyword,
            ),
            HomeState(
              error: null,
              items: mockResults,
              totalSearchResult: mockResults.length,
              page: HomeScreenConst.firstPageKey,
              isLastPage: mockResults.length < HomeScreenConst.fetchPerPage,
              keyword: searchKeyword,
            ),
          ];
        },
        verify: (_) {
          verify(
            mockGameRepository.getListOfGames(
              const GameRequest(
                page: HomeScreenConst.firstPageKey,
                pageSize: HomeScreenConst.fetchPerPage,
                searchKeyword: searchKeyword,
              ),
            ),
          );
        });

    blocTest<HomeBloc, HomeState>('validate state when error',
        setUp: () async {
          when(
            mockGameRepository.getListOfGames(
              const GameRequest(
                page: HomeScreenConst.firstPageKey,
                pageSize: HomeScreenConst.fetchPerPage,
                searchKeyword: searchKeyword,
              ),
            ),
          ).thenAnswer(
            (_) => Future.value(ResponseList(0, [], mockError)),
          );
        },
        build: () => HomeBloc(),
        act: (bloc) {
          bloc.add(const SearchEvent(keyword: searchKeyword));
        },
        expect: () {
          return <HomeState>[
            const HomeState(
              error: null,
              items: null,
              totalSearchResult: 0,
              keyword: searchKeyword,
            ),
            HomeState(
              error: ResponseException(mockError.toString()),
              items: null,
              totalSearchResult: 0,
              keyword: searchKeyword,
            ),
          ];
        },
        verify: (_) {
          verify(
            mockGameRepository.getListOfGames(
              const GameRequest(
                page: HomeScreenConst.firstPageKey,
                pageSize: HomeScreenConst.fetchPerPage,
                searchKeyword: searchKeyword,
              ),
            ),
          );
        });
  });

  group('Validate switchItemView functionality', () {
    blocTest<HomeBloc, HomeState>(
      'SwitchItemViewEvent state when success',
      build: () => HomeBloc(),
      act: (bloc) {
        bloc.add(const SwitchItemViewEvent(HomeItemViewType.list));
      },
      expect: () {
        return <HomeState>[
          const HomeState(itemViewType: HomeItemViewType.list)
        ];
      },
    );
  });

  group('Validate navigateToGameScreen functionality', () {
    const gameId = 1123;

    blocTest<HomeBloc, HomeState>(
        'NavigateToGameScreenEvent state when success',
        setUp: () async {
          when(mockAppRouter.rootNavigateTo(Routes.game, gameId))
              .thenAnswer((_) => Future.value());
        },
        build: () => HomeBloc(),
        act: (bloc) {
          bloc.add(const NavigateToGameScreenEvent(gameId: gameId));
        },
        verify: (_) {
          verify(mockAppRouter.rootNavigateTo(Routes.game, gameId));
        });
  });
}
