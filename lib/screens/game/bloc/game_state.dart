part of 'game_bloc.dart';

class GameState extends Equatable {
  final bool isLoading;
  final GameDetailResponse? item;
  final dynamic error;

  const GameState({this.isLoading = true, this.item, this.error});

  GameState copyWith({
    bool? isLoading,
    GameDetailResponse? item,
    dynamic error,
  }) {
    return GameState(
      isLoading: isLoading ?? this.isLoading,
      item: item ?? this.item,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, item, error];
}
