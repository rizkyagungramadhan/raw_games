import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/style/app_dimen.dart';

void main() {
  test('Validate AppDimen values are correct', () {
    expect(AppDimen.paddingExtraSmall, equals(4.0));
    expect(AppDimen.paddingSmall, equals(8.0));
    expect(AppDimen.paddingMedium, equals(16.0));
    expect(AppDimen.paddingLarge, equals(24.0));
    expect(AppDimen.paddingExtraLarge, equals(32.0));

    expect(AppDimen.fontSmall, equals(8.0));
    expect(AppDimen.fontMedium, equals(12.0));
    expect(AppDimen.fontLarge, equals(16.0));
    expect(AppDimen.fontExtraLarge, equals(20.0));

    expect(AppDimen.radiusSmall, equals(8.0));
    expect(AppDimen.radiusMedium, equals(16.0));

    expect(AppDimen.sizeLoadingIndicator, equals(32.0));
    expect(AppDimen.sizeIconSmall, equals(12.0));
    expect(AppDimen.sizeIconMedium, equals(16.0));
    expect(AppDimen.sizeIconLarge, equals(20.0));
    expect(AppDimen.sizeIconExtraLarge, equals(24.0));
  });
}
