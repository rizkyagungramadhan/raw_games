import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raw_games/api/repository/game/game_repository.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_request.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_response.dart';
import 'package:raw_games/common/exception/app_exception.dart';
import 'package:raw_games/common/exception/response_exception.dart';
import 'package:raw_games/di/service_locator.dart';
import 'package:raw_games/screens/game/const/game_screen_const.dart';
import 'package:raw_games/utils/router/app_router.dart';
import 'package:raw_games/utils/router/route.dart';
import 'package:url_launcher/url_launcher.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final _appRouter = serviceLocator<AppRouter>();
  final _gameRepo = serviceLocator<GameRepository>();

  GameBloc() : super(const GameState()) {
    on<FetchDetailEvent>(_fetchDetail);
    on<FetchScreenshotEvent>(_fetchScreenshots);
    on<OpenDetailImageEvent>(_openImageDetail);
    on<OpenBrowserEvent>(_openUrlOnBrowser);
  }

  Future<void> _fetchDetail(
    FetchDetailEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final item = await _gameRepo.getDetail(gameId: event.gameId);

      emit(state.copyWith(isLoading: false, item: item));

      add(FetchScreenshotEvent(gameId: event.gameId));
    } catch (error) {
      emit(state.copyWith(isLoading: false, error: error));
    }
  }

  Future<void> _fetchScreenshots(
    FetchScreenshotEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      emit(state.copyWith(
        getScreenshotError: null,
        screenshots: state.screenshots,
      ));

      final request = GameScreenshotRequest(
        gameId: event.gameId,
        page: event.page,
        pageSize: GameScreenConst.fetchScreenshotPerPage,
      );

      final response = await _gameRepo.getScreenshots(request);

      if (response.error != null) {
        throw ResponseException(response.error);
      }

      final currentItem = state.screenshots ?? <GameScreenshotResponse>[];
      final items = currentItem + response.results;
      final isLastPage =
          response.results.length < GameScreenConst.fetchScreenshotPerPage;

      emit(
        state.copyWith(
          screenshots: items,
          screenshotPage: isLastPage ? event.page : event.page + 1,
          isLastScreenshotPage: isLastPage,
          getScreenshotError: response.error,
        ),
      );
    } catch (error) {
      emit(state.copyWith(getScreenshotError: error));
    }
  }

  Future<void> _openImageDetail(
      OpenDetailImageEvent event, Emitter<GameState> _) async {
    try {
      unawaited(_appRouter.rootNavigateTo(Routes.gallery, event.image));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> _openUrlOnBrowser(
      OpenBrowserEvent event, Emitter<GameState> _) async {
    try {
      if (!await launchUrl(Uri.parse(event.url), mode: LaunchMode.externalApplication)) {
        throw AppException('Could not launch ${event.url}');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
