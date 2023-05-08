import 'package:flutter/material.dart';
import 'package:raw_games/utils/router/route.dart';
import 'package:raw_games/utils/router/route_definition.dart';
import 'package:raw_games/utils/router/route_info.dart';

typedef RouteBuilder = Widget Function(
  BuildContext context,
  RouteInfo information,
);

class AppRouter {
  GlobalKey<NavigatorState> rootNavigationKey = GlobalKey<NavigatorState>();

  final Map<RouteDefinition, RouteBuilder> _routerRegistry = {};

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final route = findRouteFromSetting(settings);
    if (route != null) {
      return MaterialPageRoute(
        builder: (context) {
          return _routerRegistry[route]?.call(
                context,
                RouteInfo(argument: settings.arguments),
              ) ??
              const SizedBox.shrink();
        },
        settings: settings,
      );
    }
    return null;
  }

  RouteDefinition? findRouteFromSetting(RouteSettings? settings) {
    if (settings == null) return null;
    for (var route in _routerRegistry.keys) {
      if (isRouteMatchFromSetting(route, settings)) {
        return route;
      }
    }
    return null;
  }

  bool isRouteMatchFromSetting(RouteDefinition route, RouteSettings settings) {
    return route.name == settings.name;
  }

  String? getActiveRouteName() {
    final route = getActiveRoute();
    return findRouteFromSetting(route?.settings)?.name ?? route?.settings.name;
  }

  Route<dynamic>? getActiveRoute() {
    Route<dynamic>? currentRoute;
    rootNavigationKey.currentState?.popUntil((route) {
      currentRoute = route;
      return true;
    });
    return currentRoute;
  }

  void registerRoute(RouteDefinition routeDefinition, RouteBuilder builder) {
    _routerRegistry[routeDefinition] = builder;
  }

  Future<dynamic> rootNavigateTo(RouteDefinition route, [dynamic args]) {
    return rootNavigationKey.currentState!
        .pushNamed(route.name, arguments: args);
  }

  Future<dynamic> rootClearAndNavigateTo(RouteDefinition route,
      [dynamic args]) {
    return rootNavigationKey.currentState!.pushNamedAndRemoveUntil(
      route.name,
      ((Route<dynamic> route) => false),
      arguments: args,
    );
  }

  void rootGoBack() {
    return rootNavigationKey.currentState?.pop();
  }

  void rootGoBackToRoot() {
    rootNavigationKey.currentState?.popUntil(
      ModalRoute.withName(Routes.home.name),
    );
  }
}
