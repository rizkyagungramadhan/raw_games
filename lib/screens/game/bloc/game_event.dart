part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class FetchDetailEvent extends GameEvent {
  final int gameId;

  const FetchDetailEvent(this.gameId);

  @override
  List<Object> get props => [gameId];
}
