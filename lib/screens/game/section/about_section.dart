import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart';
import 'package:raw_games/screens/game/const/game_screen_const.dart';
import 'package:raw_games/utils/style/app_color.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';

class AboutSection extends StatelessWidget {
  final GameDetailResponse item;

  const AboutSection({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
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
          child: Column(
            children: [
              ExpandableText(
                item.description,
                expandText: 'Read more',
                collapseText: 'Read less',
                style: AppTextStyle.regular(),
                animation: true,
                expandOnTextTap: true,
                collapseOnTextTap: true,
                animationDuration: const Duration(seconds: 1),
                maxLines: GameScreenConst.maxDescriptionLine,
              ),
              if (item.genres.isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppDimen.paddingLarge),
                      Text('Genre', style: AppTextStyle.bold()),
                      const SizedBox(height: AppDimen.paddingMedium),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: item.genres.map((genre) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimen.paddingSmall,
                              vertical: 2,
                            ),
                            margin: const EdgeInsets.only(
                              bottom: AppDimen.paddingSmall,
                              right: AppDimen.paddingSmall,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColor.greyDark,
                              borderRadius: BorderRadius.all(
                                Radius.circular(AppDimen.radiusSmall),
                              ),
                            ),
                            child: Text(
                              genre.name,
                              style: AppTextStyle.regular(),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
