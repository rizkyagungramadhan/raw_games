import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/env/environment.dart';
import 'package:raw_games/utils/env/environment_config.dart';
import 'package:raw_games/utils/env/flavor.dart';

void main() {
  test('Validate EnvironmentConfig default value for staging only', () {
    if (Environment.getAppEnvironment() != Flavor.stg) return;

    // Assert
    expect(EnvironmentConfig.activeEnvironment, equals('staging'));
    expect(
        EnvironmentConfig.apiKey, equals('4230c52b297a48c0b8a55c8546ff9114'));
    expect(EnvironmentConfig.apiUrl, equals('https://api.rawg.io/api'));
  });
}
