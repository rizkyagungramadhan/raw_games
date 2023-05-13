part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String? keyword;
  final int totalSearchResult;
  final HomeItemViewType itemViewType;
  final int? page;
  final List<GameResponse>? items;
  final bool isLastPage;
  final dynamic error;

  const HomeState({
    this.keyword,
    this.totalSearchResult = 0,
    this.itemViewType = HomeItemViewType.grid,
    this.page,
    this.items = const [],
    this.isLastPage = false,
    this.error,
  });

  HomeState copyWith({
    String? keyword,
    int? totalSearchResult,
    HomeItemViewType? itemViewType,
    int? page,
    List<GameResponse>? items,
    bool? isLastPage,
    dynamic error,
  }) {
    return HomeState(
      keyword: keyword ?? this.keyword,
      totalSearchResult: totalSearchResult ?? this.totalSearchResult,
      itemViewType: itemViewType ?? this.itemViewType,
      page: page ?? this.page,
      items: items,
      isLastPage: isLastPage ?? this.isLastPage,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        keyword,
        totalSearchResult,
        itemViewType,
        page,
        items,
        isLastPage,
        error,
      ];
}
