import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/utils/style/app_color.dart';

void main() {
  test('Validate AppColor values are correct', () {
    expect(AppColor.primary, equals(const Color(0xFF234FE0)));
    expect(AppColor.accent, equals(const Color(0xFFE2E5EC)));
    expect(AppColor.grey, equals(const Color(0xFFF2F2F2)));
    expect(AppColor.greyDark, equals(const Color(0xFFDEDFE0)));
    expect(AppColor.yellow, equals(const Color(0xFFE7B564)));
    expect(AppColor.green, equals(const Color(0xFF5FAB41)));
  });
}