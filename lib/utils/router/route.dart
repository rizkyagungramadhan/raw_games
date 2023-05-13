import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_response.dart';
import 'package:raw_games/screens/gallery/gallery_screen.dart';
import 'package:raw_games/screens/game/game_screen.dart';
import 'package:raw_games/screens/home/home_screen.dart';
import 'package:raw_games/utils/router/app_router.dart';
import 'package:raw_games/utils/router/route_definition.dart';

class Routes {
  const Routes._();

  static const home = RouteDefinition(name: '/');
  static const game = RouteDefinition(name: '/game');
  static const gallery = RouteDefinition(name: '/gallery');
}

class AppRoute {
  const AppRoute._();

  static void initializeAllRoutes(AppRouter appRouter) {
    appRouter
      ..registerRoute(
        Routes.home,
        (_, __) => const HomeScreen(),
      )
      ..registerRoute(
        Routes.game,
        (_, information) {
          final gameId = information.argument as int;
          return GameScreen(gameId: gameId);
        },
      )
      ..registerRoute(
        Routes.gallery,
        (_, information) {
          final arg = information.argument as GameScreenshotResponse;

          return GalleryScreen(
            imageUrl: arg.imageUrl,
            imageId: arg.id.toString(),
            imageHeight: arg.height.roundToDouble(),
            imageWidth: arg.width.roundToDouble(),
          );
        },
      );
  }
}
