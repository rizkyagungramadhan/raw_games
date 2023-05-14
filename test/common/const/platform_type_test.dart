import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raw_games/common/const/platform_type.dart';

void main() {
  test('Validate PlatformType default values', () {
    expect(PlatformType.values.length, equals(7));

    late PlatformType stub;

    // Validate PlatformType.android
    stub = PlatformType.android;
    expect(stub.slug, equals('android'));
    expect(stub.iconData, equals(FontAwesomeIcons.android));

    // Validate PlatformType.iOS
    stub = PlatformType.iOS;
    expect(stub.slug, equals('ios'));
    expect(stub.iconData, equals(FontAwesomeIcons.apple));

    // Validate PlatformType.pc
    stub = PlatformType.pc;
    expect(stub.slug, equals('pc'));
    expect(stub.iconData, equals(FontAwesomeIcons.desktop));

    // Validate PlatformType.playStation5
    stub = PlatformType.playStation5;
    expect(stub.slug, equals('playstation5'));
    expect(stub.iconData, equals(FontAwesomeIcons.playstation));

    // Validate PlatformType.playStation4
    stub = PlatformType.playStation4;
    expect(stub.slug, equals('playstation4'));
    expect(stub.iconData, equals(FontAwesomeIcons.playstation));

    // Validate PlatformType.xboxOne
    stub = PlatformType.xboxOne;
    expect(stub.slug, equals('xbox-one'));
    expect(stub.iconData, equals(FontAwesomeIcons.xbox));

    // Validate PlatformType.xboxSeriesX
    stub = PlatformType.xboxSeriesX;
    expect(stub.slug, equals('xbox-series-x'));
    expect(stub.iconData, equals(FontAwesomeIcons.xbox));
  });
}
