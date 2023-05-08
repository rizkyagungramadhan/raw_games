import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raw_games/di/service_locator.dart';
import 'package:raw_games/utils/router/app_router.dart';
import 'package:raw_games/utils/router/route.dart';
import 'package:raw_games/utils/style/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    setupServiceLocator();

    final appRouter = serviceLocator<AppRouter>();
    AppRoute.initializeAllRoutes(appRouter);

    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: kDebugMode,
        builder: (context, child) => MediaQuery(
          /// Lock font to always use 1.0 or normal
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child ?? const SizedBox.shrink(),
        ),
        navigatorKey: appRouter.rootNavigationKey,
        theme: AppTheme.theme,
        initialRoute: Routes.home.name,
        onGenerateRoute: (RouteSettings settings) {
          return appRouter.generateRoute(settings);
        },
      ),
    );
  });
}
