import 'package:get_it/get_it.dart';
import 'package:raw_games/api/client/dio_client.dart';
import 'package:raw_games/api/client/dio_client_impl.dart';
import 'package:raw_games/api/repository/game/game_repository.dart';
import 'package:raw_games/api/repository/game/game_repository_impl.dart';
import 'package:raw_games/utils/router/app_router.dart';

GetIt serviceLocator = GetIt.instance;

/// Inject all dependencies
void setupServiceLocator() {
  _registerAppDependencies();
  _registerRepositories();
}

void _registerRepositories() {
  serviceLocator.registerLazySingleton<GameRepository>(
    () => GameRepositoryImpl(),
  );
}

void _registerAppDependencies() {
  serviceLocator.registerLazySingleton<AppRouter>(() => AppRouter());
  serviceLocator.registerLazySingleton<DioClient>(
    () => DioClientImpl.initialize(),
  );
}
