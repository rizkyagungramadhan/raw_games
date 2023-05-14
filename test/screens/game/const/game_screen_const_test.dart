import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/screens/game/const/game_screen_const.dart';

void main() {
  test('Validate all GameScreenConst value', () {
    expect(GameScreenConst.maxDescriptionLine, equals(5));
    expect(GameScreenConst.fetchScreenshotPerPage, equals(5));
    expect(GameScreenConst.firstScreenshotPageKey, equals(1));
    expect(GameScreenConst.shimmerTotalItem, equals(2));
  });
}
