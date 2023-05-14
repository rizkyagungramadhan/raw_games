import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/env/flavor.dart';

void main() {
  test('Validate Flavor properties', () {
    // Arrange
    late Flavor flavor;

    // Validate Flavor.prod
    flavor = Flavor.prod;
    expect(flavor.name, 'production');

    // Validate Flavor.stg
    flavor = Flavor.stg;
    expect(flavor.name, 'staging');

    expect(Flavor.values.length, equals(2));
  });
}
