part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchEvent extends HomeEvent {
  final int page;

  const FetchEvent({this.page = HomeConst.firstPageKey});

  @override
  List<Object> get props => [page];
}

class SwitchItemViewEvent extends HomeEvent {
  final HomeItemViewType itemViewType;

  const SwitchItemViewEvent(this.itemViewType);

  @override
  List<Object> get props => [itemViewType];
}

class NavigateToGameScreenEvent extends HomeEvent {
  final int gameId;

  const NavigateToGameScreenEvent({required this.gameId});

  @override
  List<Object> get props => [gameId];
}
