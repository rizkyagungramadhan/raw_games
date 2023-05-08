
import 'package:raw_games/utils/env/environment_config.dart';
import 'package:raw_games/utils/env/flavor.dart';

class Environment {

  const Environment._();

  static Flavor getAppEnvironment() {
    return Flavor.values.firstWhere(
      (f) => f.name == EnvironmentConfig.activeEnvironment,
    );
  }
}
