import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PlatformType {
  android('android', FontAwesomeIcons.android),
  iOS('ios', FontAwesomeIcons.apple),
  pc('pc', FontAwesomeIcons.desktop),
  playStation5('playstation5', FontAwesomeIcons.playstation),
  playStation4('playstation4', FontAwesomeIcons.playstation),
  xboxOne('xbox-one', FontAwesomeIcons.xbox),
  xboxSeriesX('xbox-series-x"', FontAwesomeIcons.xbox);

  final String slug;
  final IconData iconData;

  const PlatformType(this.slug, this.iconData);
}
