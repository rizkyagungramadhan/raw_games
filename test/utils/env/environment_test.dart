import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/env/environment.dart';
import 'package:raw_games/utils/env/flavor.dart';

void main() {
  /// This should always be staging environment
  /// Since production do not need to run unit test
  /// We run unit test on staging, and if staging success it can move into
  /// production build phase
  test('Validate Environment getAppEnvironment() functionality', () {
    // Arrange
    final flavor = Environment.getAppEnvironment();

    // Assert
    expect(flavor, equals(Flavor.stg));
  });
}
