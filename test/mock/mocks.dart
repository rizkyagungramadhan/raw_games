import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:raw_games/api/client/dio_client.dart';
import 'package:raw_games/api/repository/game/game_repository.dart';
import 'package:raw_games/utils/router/app_router.dart';

import 'mocks.mocks.dart';

GetIt serviceLocatorTest = GetIt.instance;

@GenerateMocks([
  BuildContext,
  GameRepository,
  AppRouter,
  DioClient,
])
void initMockDependencies() {
  serviceLocatorTest.allowReassignment = true;

  _initMockAppRouter();
  serviceLocatorTest
      .registerLazySingleton<GameRepository>(() => MockGameRepository());
  serviceLocatorTest.registerLazySingleton<AppRouter>(() => MockAppRouter());
  serviceLocatorTest.registerLazySingleton<DioClient>(
        () => MockDioClient(),
  );
}

_initMockAppRouter() {
  final mockAppRouter = MockAppRouter();
  final route = MaterialPageRoute(
    builder: (context) => const SizedBox(),
  );

  serviceLocatorTest.registerLazySingleton<AppRouter>(() => mockAppRouter);

  when(mockAppRouter.rootNavigationKey)
      .thenAnswer((_) => GlobalKey<NavigatorState>());
  when(mockAppRouter.generateRoute(any)).thenAnswer((_) => route);
  when(mockAppRouter.registerRoute(any, any)).thenAnswer((_) => {});
  when(mockAppRouter.getActiveRouteName()).thenAnswer((_) => 'route');
}
