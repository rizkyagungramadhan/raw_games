import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';
import 'package:raw_games/screens/home/bloc/home_bloc.dart';
import 'package:raw_games/screens/home/const/home_screen_const.dart';
import 'package:raw_games/utils/extensions/context_extension.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';
import 'package:raw_games/widgets/shimmer_box.dart';

class HomeGridCard extends StatelessWidget {
  final GameResponse item;

  const HomeGridCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<HomeBloc>()
            .add(NavigateToGameScreenEvent(gameId: item.id));
      },
      child: Container(
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
        child: Column(
          children: [
            Flexible(
              flex: 6,
              child: SizedBox(
                width: double.infinity,
                height: HomeScreenConst.imageHeight,
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl,
                  memCacheHeight:
                      context.fitImageCache(HomeScreenConst.imageHeight),
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (_, __, ___) {
                    return const ShimmerBox(
                      height: HomeScreenConst.imageHeight,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppDimen.radiusMedium),
                        topRight: Radius.circular(AppDimen.radiusMedium),
                      ),
                    );
                  },
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(AppDimen.paddingSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppDimen.paddingSmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (item.platforms.isNotEmpty)
                          Row(
                            children: item.platformIcons.map(
                              (iconData) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: AppDimen.paddingExtraSmall,
                                  ),
                                  child: Icon(
                                    iconData,
                                    size: AppDimen.sizeIconSmall,
                                    color: Colors.black54,
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        if (item.metacriticScore != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: AppDimen.paddingExtraSmall,
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
                    const SizedBox(height: AppDimen.paddingSmall),
                    Expanded(
                      child: Text(
                        '${item.name}\n',
                        style: AppTextStyle.bold(size: AppDimen.fontMedium),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
