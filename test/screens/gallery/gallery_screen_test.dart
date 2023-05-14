import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:raw_games/screens/gallery/gallery_screen.dart';

import '../../test_utils/test_utils.dart';

void main() {
  testWidgets('GalleryScreen shows cached network image',
      (WidgetTester tester) async {
    // Arrange
    const imageUrl = 'https://example.com/image.jpg';
    const imageId = '1';
    const imageHeight = 100.0;
    const imageWidth = 200.0;

    // Act
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: const GalleryScreen(
            imageUrl: imageUrl,
            imageId: imageId,
            imageHeight: imageHeight,
            imageWidth: imageWidth,
          ),
        ),
      );
    });

    // Assert
    final cachedImageFinder = find.byType(CachedNetworkImage);
    expect(cachedImageFinder, findsOneWidget);
    final cachedImageWidget =
        cachedImageFinder.evaluate().first.widget as CachedNetworkImage;
    expect(cachedImageWidget.imageUrl, imageUrl);
    expect(cachedImageWidget.fit, BoxFit.contain);
  });
}
