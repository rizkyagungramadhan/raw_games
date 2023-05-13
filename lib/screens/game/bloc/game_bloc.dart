import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:raw_games/api/repository/game/game_repository.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart';
import 'package:raw_games/di/service_locator.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final _gameRepo = serviceLocator<GameRepository>();

  GameBloc() : super(const GameState()) {
    on<FetchDetailEvent>(_fetchDetail);
  }

  Future<void> _fetchDetail(
    FetchDetailEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final item = await _gameRepo.getDetail(gameId: event.gameId);

      emit(state.copyWith(isLoading: false, item: item));
    } catch (error) {
      emit(state.copyWith(isLoading: false, error: error));
    }
  }
}
