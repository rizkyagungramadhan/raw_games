import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/screens/home/bloc/home_bloc.dart';
import 'package:raw_games/screens/home/const/home_screen_const.dart';

void main() {
  group('Validate HomeState', () {
    test('equality value comparison', () {
      const state1 = HomeState(
        keyword: 'game',
        totalSearchResult: 20,
        itemViewType: HomeItemViewType.grid,
        page: 1,
        items: [],
        isLastPage: false,
        error: null,
      );

      const state2 = HomeState(
        keyword: 'game',
        totalSearchResult: 20,
        itemViewType: HomeItemViewType.grid,
        page: 1,
        items: [],
        isLastPage: false,
        error: null,
      );

      expect(state1, equals(state2));
    });

    test('copyWith returns a new object with updated fields', () {
      const state1 = HomeState(
        keyword: 'game',
        totalSearchResult: 20,
        itemViewType: HomeItemViewType.grid,
        page: 1,
        items: [],
        isLastPage: false,
        error: null,
      );

      final state2 = state1.copyWith(
        keyword: 'new game',
        totalSearchResult: 30,
        itemViewType: HomeItemViewType.list,
        page: 2,
        items: [],
        isLastPage: true,
        error: 'error',
      );

      expect(state2.keyword, equals('new game'));
      expect(state2.totalSearchResult, equals(30));
      expect(state2.itemViewType, equals(HomeItemViewType.list));
      expect(state2.page, equals(2));
      expect(state2.items, equals([]));
      expect(state2.isLastPage, equals(true));
      expect(state2.error, equals('error'));
    });
  });
}
