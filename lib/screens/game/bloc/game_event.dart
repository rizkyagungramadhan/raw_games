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

class FetchScreenshotEvent extends GameEvent {
  final int page;
  final int gameId;

  const FetchScreenshotEvent({
    required this.gameId,
    this.page = GameScreenConst.firstScreenshotPageKey,
  });

  @override
  List<Object> get props => [gameId, page];
}

class OpenDetailImageEvent extends GameEvent {
  final GameScreenshotResponse image;

  const OpenDetailImageEvent(this.image);

  @override
  List<Object> get props => [image];
}
