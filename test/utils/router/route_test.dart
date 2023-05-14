import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:raw_games/utils/router/app_router.dart';
import 'package:raw_games/utils/router/route.dart';

import '../../mock/mocks.dart';
import '../../mock/mocks.mocks.dart';

void main() {
  late MockAppRouter mockAppRouter;

  group('Validate Routes', () {
    test('Validate Routes default member value', () {
      expect(Routes.home.name, equals('/'));
      expect(Routes.game.name, equals('/game'));
      expect(Routes.gallery.name, equals('/gallery'));
    });
  });

  group('Validate AppRoute', () {
    setUpAll(() {
      initMockDependencies();
      mockAppRouter = serviceLocatorTest<AppRouter>() as MockAppRouter;
    });

    test('Validate initializeAllRoutes() functionality', () {
      // Arrange
      when(mockAppRouter.registerRoute(Routes.home, any)).thenAnswer((_) {});
      when(mockAppRouter.registerRoute(Routes.game, any)).thenAnswer((_) {});
      when(mockAppRouter.registerRoute(Routes.gallery, any)).thenAnswer((_) {});

      // Act
      AppRoute.initializeAllRoutes(mockAppRouter);

      // Assert
      verify(mockAppRouter.registerRoute(Routes.home, any));
      verify(mockAppRouter.registerRoute(Routes.game, any));
      verify(mockAppRouter.registerRoute(Routes.gallery, any));
    });
  });
}
