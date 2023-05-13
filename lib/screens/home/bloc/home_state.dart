part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeItemViewType itemViewType;
  final int? page;
  final List<GameResponse>? items;
  final bool isLastPage;
  final dynamic error;

  const HomeState({
    this.itemViewType = HomeItemViewType.grid,
    this.page,
    this.items = const [],
    this.isLastPage = false,
    this.error,
  });

  HomeState copyWith({
    HomeItemViewType? itemViewType,
    int? page,
    List<GameResponse>? items,
    bool? isLastPage,
    dynamic error,
  }) {
    return HomeState(
      itemViewType: itemViewType ?? this.itemViewType,
      page: page ?? this.page,
      items: items,
      isLastPage: isLastPage ?? this.isLastPage,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        itemViewType,
        page,
        items,
        isLastPage,
        error,
      ];
}
