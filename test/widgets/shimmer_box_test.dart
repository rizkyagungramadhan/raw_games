import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raw_games/widgets/shimmer_box.dart';
import 'package:shimmer/shimmer.dart';

import '../test_utils/test_utils.dart';

void main() {
  testWidgets(
      'ShimmerBox should display a shimmering box with given properties',
      (WidgetTester tester) async {
    // Arrange
    const width = 200.0;
    const height = 100.0;
    const padding = EdgeInsets.all(8.0);
    const baseColor = Colors.red;
    const backgroundColor = Colors.white;
    const borderRadius = BorderRadius.all(Radius.circular(16.0));

    // Act
    await tester.pumpWidget(
      buildTestableWidget(
        child: const ShimmerBox(
          width: width,
          height: height,
          padding: padding,
          baseColor: baseColor,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
        ),
      ),
    );

    // Assert
    final shimmerBoxFinder = find.byType(Shimmer);
    expect(shimmerBoxFinder, findsOneWidget);

    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    final containerWidget = tester.widget<Container>(containerFinder);
    expect(
        containerWidget.decoration,
        const BoxDecoration(
          borderRadius: borderRadius,
          color: backgroundColor,
        ));
  });
}
