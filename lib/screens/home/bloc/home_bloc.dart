import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raw_games/api/repository/game/game_repository.dart';
import 'package:raw_games/api/repository/game/model/game_request.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';
import 'package:raw_games/common/exception/response_exception.dart';
import 'package:raw_games/di/service_locator.dart';
import 'package:raw_games/screens/home/const/home_screen_const.dart';
import 'package:raw_games/utils/extensions/string_extension.dart';
import 'package:raw_games/utils/router/app_router.dart';
import 'package:raw_games/utils/router/route.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _appRouter = serviceLocator<AppRouter>();
  final _gameRepo = serviceLocator<GameRepository>();

  HomeBloc() : super(const HomeState()) {
    on<FetchEvent>(_fetchGames);
    on<SwitchItemViewEvent>(_switchItemView);
    on<NavigateToGameScreenEvent>(_navigateToGameScreen);
    on<SearchEvent>(_search);
  }

  Future<void> _fetchGames(FetchEvent event, Emitter<HomeState> emit) async {
    try {
      final isRefreshEvent = event == const FetchEvent();

      emit(
        state.copyWith(
          error: null,
          items: isRefreshEvent ? null : state.items,
          totalSearchResult: isRefreshEvent ? 0 : state.totalSearchResult,
        ),
      );

      final request = GameRequest(
        page: event.page,
        pageSize: HomeScreenConst.fetchPerPage,
        searchKeyword: state.keyword,
      );
      final response = await _gameRepo.getListOfGames(request);

      if (response.error != null) {
        throw ResponseException(response.error.toString());
      }

      final currentItem = state.items ?? <GameResponse>[];
      final items =
          (isRefreshEvent ? <GameResponse>[] : currentItem) + response.results;
      final isLastPage = response.results.length < HomeScreenConst.fetchPerPage;
      emit(
        state.copyWith(
          items: items,
          page: isLastPage ? event.page : event.page + 1,
          isLastPage: isLastPage,
          error: response.error,
          totalSearchResult: response.count ?? 0,
        ),
      );
    } catch (error) {
      emit(state.copyWith(error: error));
    }
  }

  Future<void> _search(
    SearchEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      if (event.keyword.toLowerCase() != state.keyword?.orEmpty.toLowerCase()) {
        emit(state.copyWith(keyword: event.keyword));

        add(const FetchEvent());
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print('$error\n$stacktrace');
      }
    }
  }

  Future<void> _switchItemView(
    SwitchItemViewEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(itemViewType: event.itemViewType, items: state.items));
  }

  Future<void> _navigateToGameScreen(
    NavigateToGameScreenEvent event,
    Emitter<HomeState> _,
  ) async {
    try {
      unawaited(
        _appRouter.rootNavigateTo(Routes.game, event.gameId),
      );
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print('$error\n$stacktrace');
      }
    }
  }
}
