import 'package:raw_games/screens/home/home_screen.dart';
import 'package:raw_games/utils/router/app_router.dart';
import 'package:raw_games/utils/router/route_definition.dart';

class Routes {
  const Routes._();

  static const home = RouteDefinition(name: '/');
}

class AppRoute {
  const AppRoute._();

  static void initializeAllRoutes(AppRouter appRouter) {
    appRouter.registerRoute(
      Routes.home,
      (_, __) => const HomeScreen(),
    );
  }
}
