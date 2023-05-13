import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:raw_games/di/service_locator.dart';
import 'package:raw_games/utils/extensions/context_extension.dart';
import 'package:raw_games/utils/router/app_router.dart';
import 'package:raw_games/utils/style/app_dimen.dart';

class GalleryScreen extends StatelessWidget {
  final String imageId;
  final String imageUrl;
  final double? imageHeight;
  final double? imageWidth;

  const GalleryScreen({
    Key? key,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    required this.imageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimen.paddingMedium,
              ),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
            onPressed: () => serviceLocator<AppRouter>().rootGoBack(),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: InteractiveViewer(
            maxScale: 4.0,
            minScale: 1.0,
            panEnabled: true,
            scaleEnabled: true,
            alignment: Alignment.center,
            boundaryMargin: const EdgeInsets.all(0),
            child: Hero(
              tag: imageId,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                memCacheHeight: context.fitImageCache(imageHeight),
                memCacheWidth: context.fitImageCache(imageWidth),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
