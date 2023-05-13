import 'package:flutter/material.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';

class RatingStarIcon extends StatelessWidget {
  final double rating;
  final double size;
  final int maxRating;
  final bool showRatingNumber;

  const RatingStarIcon({
    super.key,
    required this.rating,
    this.size = AppDimen.sizeIconLarge,
    this.maxRating = 5,
    this.showRatingNumber = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  List<Widget>.generate(
        maxRating,
        (index) {
          final fullStars = rating.floor();
          final halfStar = rating - fullStars;
          if (index < fullStars) {
            return Icon(Icons.star, size: size, color: Colors.amber);
          } else if (index == fullStars && halfStar > 0) {
            return Icon(Icons.star_half, size: size, color: Colors.amber);
          } else {
            return Icon(Icons.star_border, size: size, color: Colors.grey);
          }
        },
      ) + [
        const SizedBox(width: AppDimen.paddingSmall),
        Text('($rating)', style: AppTextStyle.regular(),)
      ],
    );
  }
}
