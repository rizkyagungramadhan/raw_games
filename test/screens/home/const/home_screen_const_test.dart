import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/screens/home/const/home_screen_const.dart';

void main() {
  group('Validate HomeScreenConst', () {
    test('Validate HomeScreenConst value', () {
      expect(HomeScreenConst.fetchPerPage, equals(10));
      expect(HomeScreenConst.firstPageKey, equals(1));
      expect(HomeScreenConst.shimmerGridHeight, equals(120.0));
      expect(HomeScreenConst.shimmerTotalItem, equals(4));
      expect(HomeScreenConst.imageHeight, equals(120.0));
      expect(HomeScreenConst.listHeight, equals(120.0));
    });
  });

  group('Validate HomeViewType', () {
    test('Validate HomeViewType value', () {
      expect(HomeItemViewType.values.length, equals(2));
      expect(HomeItemViewType.grid.index, equals(0));
      expect(HomeItemViewType.list.index, equals(1));
    });
  });
}
