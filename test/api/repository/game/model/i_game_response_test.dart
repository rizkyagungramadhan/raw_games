import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raw_games/api/repository/game/model/i_game_response.dart';
import 'package:raw_games/api/repository/game/model/platform_response.dart';
import 'package:raw_games/api/repository/game/model/platform_wrapper.dart';
import 'package:raw_games/utils/style/app_color.dart';

void main() {
  group('Validate IGameResponse interface', () {
    final platform1 = PlatformResponse(1, 'PC', 'pc');
    final platform2 = PlatformResponse(2, 'PlayStation 4', 'playstation4');
    final platform3 = PlatformResponse(3, 'Xbox One', 'xbox-one');
    final platforms = [
      PlatformWrapper(platform1),
      PlatformWrapper(platform2),
      PlatformWrapper(platform3),
    ];

    test('Get platformIcons should return correct result', () {
      final game = _TestGameResponse(platforms: platforms);
      final icons = game.platformIcons;
      expect(icons.length, equals(3));
      expect(
        icons,
        equals(
          {
            FontAwesomeIcons.desktop,
            FontAwesomeIcons.playstation,
            FontAwesomeIcons.xbox
          },
        ),
      );
    });

    test('Get scoreColor should return correct result', () {
      final game1 = _TestGameResponse(metacriticScore: 50, platforms: []);
      expect(game1.scoreColor, AppColor.yellow);

      final game2 = _TestGameResponse(metacriticScore: 80, platforms: []);
      expect(game2.scoreColor, AppColor.green);

      final game3 = _TestGameResponse(metacriticScore: null, platforms: []);
      expect(game3.scoreColor, AppColor.yellow);
    });
  });
}

class _TestGameResponse extends IGameResponse {
  _TestGameResponse({
    required List<PlatformWrapper> platforms,
    int id = 0,
    String name = '',
    num? metacriticScore,
    String imageUrl = '',
    double rating = 0.0,
  }) : super(id, name, platforms, metacriticScore, imageUrl, rating);
}
