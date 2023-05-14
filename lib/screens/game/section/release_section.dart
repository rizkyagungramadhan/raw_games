import 'package:flutter/material.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart';
import 'package:raw_games/generated/l10n.dart';
import 'package:raw_games/utils/extensions/date_time_extension.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';

class ReleaseSection extends StatelessWidget {
  final GameDetailResponse item;

  const ReleaseSection({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).releaseInformation,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.of(context).releasedOn,
                            style: AppTextStyle.bold()),
                        const SizedBox(height: AppDimen.paddingMedium),
                        Text(
                          item.releaseDate.asFullDate,
                          style: AppTextStyle.regular(),
                        ),
                      ],
                    ),
                  ),
                  if (item.platforms.isNotEmpty)
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).availableFor,
                              style: AppTextStyle.bold()),
                          const SizedBox(height: AppDimen.paddingMedium),
                          Row(
                            children: item.platformIcons.map(
                              (iconData) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: AppDimen.paddingSmall,
                                  ),
                                  child: Icon(
                                    iconData,
                                    size: AppDimen.sizeIconMedium,
                                    color: Colors.black54,
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppDimen.paddingLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.publishers.isNotEmpty)
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).publisher,
                              style: AppTextStyle.bold()),
                          const SizedBox(height: AppDimen.paddingMedium),
                          Text(
                            item.publishers.map((p) => p.name).join(', '),
                            style: AppTextStyle.regular(),
                          ),
                        ],
                      ),
                    ),
                  if (item.publishers.isNotEmpty)
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).developer,
                              style: AppTextStyle.bold()),
                          const SizedBox(height: AppDimen.paddingMedium),
                          Text(
                            item.developers.map((d) => d.name).join(', '),
                            style: AppTextStyle.regular(),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
