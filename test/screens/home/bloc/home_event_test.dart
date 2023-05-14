import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/screens/home/bloc/home_bloc.dart';
import 'package:raw_games/screens/home/const/home_screen_const.dart';

void main() {
  group('HomeEvent', () {
    test('FetchEvent should return correct props', () {
      const page = 2;
      const event = FetchEvent(page: page);

      expect(event.props, [page]);
    });

    test('SearchEvent should return correct props', () {
      const keyword = 'keyword';
      const event = SearchEvent(keyword: keyword);

      expect(event.props, [keyword]);
    });

    test('SwitchItemViewEvent should return correct props', () {
      const itemViewType = HomeItemViewType.grid;
      const event = SwitchItemViewEvent(itemViewType);

      expect(event.props, [itemViewType]);
    });

    test('NavigateToGameScreenEvent should return correct props', () {
      const gameId = 1;
      const event = NavigateToGameScreenEvent(gameId: gameId);

      expect(event.props, [gameId]);
    });
  });
}
