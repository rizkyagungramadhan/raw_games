import 'package:flutter/material.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';
import 'package:raw_games/widgets/rating_star_icon.dart';

class RatingScoreSection extends StatelessWidget {
  final GameDetailResponse item;

  const RatingScoreSection({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rating & Score',
          style: AppTextStyle.bold(size: AppDimen.fontLarge),
        ),
        const SizedBox(height: AppDimen.paddingMedium),
        Container(
          padding: const EdgeInsets.all(AppDimen.paddingMedium),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
            boxShadow: [
              BoxShadow(
                blurRadius: AppDimen.radiusSmall,
                offset: const Offset(5, 5),
                color: Colors.grey.withOpacity(0.1),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingStarIcon(rating: item.rating),
              if (item.metacriticScore != null)
                InkWell(
                  onTap: () {
                    if (item.metacriticUrl is! String) {
                      return;
                    }

                    // TODO(agung): Open on browser
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: AppDimen.paddingSmall,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppDimen.radiusMedium,
                      ),
                      border: Border.all(width: 1, color: item.scoreColor),
                      color: Colors.transparent,
                    ),
                    child: Text(
                      '${item.metacriticScore}',
                      style: AppTextStyle.regular(
                        color: item.scoreColor,
                        size: AppDimen.fontMedium,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
