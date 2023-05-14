import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_response.dart';
import 'package:raw_games/screens/game/bloc/game_bloc.dart';
import 'package:raw_games/screens/game/const/game_screen_const.dart';

void main() {
  group('Validate GameEvent', () {
    group('Validate FetchDetailEvent', () {
      test('props should contain gameId', () {
        const event = FetchDetailEvent(1);
        expect(event.props, [1]);
      });
    });

    group('Validate FetchScreenshotEvent', () {
      test('props should contain gameId and page', () {
        const event = FetchScreenshotEvent(gameId: 1, page: 1);
        expect(event.props, [1, 1]);
      });

      test('props should contain gameId and default page', () {
        const event = FetchScreenshotEvent(gameId: 1);
        expect(event.props, [1, GameScreenConst.firstScreenshotPageKey]);
      });
    });

    group('Validate OpenDetailImageEvent', () {
      test('props should contain image', () {
        final image = GameScreenshotResponse(1, 'image.png', 1080, 1080);
        final event = OpenDetailImageEvent(image);
        expect(event.props, [image]);
      });
    });

    group('Validate OpenBrowserEvent', () {
      test('props should contain url', () {
        const event = OpenBrowserEvent('https://example.com');
        expect(event.props, ['https://example.com']);
      });
    });
  });
}
