import 'package:flutter/material.dart';
import 'package:raw_games/utils/style/app_color.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets padding;

  const ShimmerBox({
    super.key,
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: AppColor.grey,
        highlightColor: Colors.white,
        enabled: true,
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimen.radiusMedium),
            ),
            color: AppColor.grey,
          ),
        ),
      ),
    );
  }
}
