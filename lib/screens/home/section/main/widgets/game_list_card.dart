import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';
import 'package:raw_games/screens/home/const/home_const.dart';
import 'package:raw_games/utils/extensions/context_extension.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';
import 'package:raw_games/widgets/shimmer_box.dart';

class GameListCard extends StatelessWidget {
  final GameResponse item;

  const GameListCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HomeConst.listHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 0.1),
            blurRadius: AppDimen.radiusSmall,
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: HomeConst.listHeight,
            width: HomeConst.listHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
            ),
            child: CachedNetworkImage(
              imageUrl: item.imageUrl,
              memCacheHeight: context.fitImageCache(HomeConst.listHeight),
              fit: BoxFit.cover,
              progressIndicatorBuilder: (_, __, ___) {
                return const ShimmerBox(height: HomeConst.listHeight);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppDimen.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${item.name}\n',
                      style: AppTextStyle.bold(size: AppDimen.fontMedium),
                      maxLines: 2,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        size: AppDimen.fontSmall,
                      ),
                      if (item.metacriticScore != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppDimen.radiusMedium,
                            ),
                            border:
                            Border.all(width: 1, color: item.scoreColor),
                            color: Colors.transparent,
                          ),
                          child: Text(
                            '${item.metacriticScore}',
                            style: AppTextStyle.regular(
                              color: item.scoreColor,
                              size: AppDimen.fontSmall,
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
