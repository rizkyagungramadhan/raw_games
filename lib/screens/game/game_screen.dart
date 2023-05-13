import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart';
import 'package:raw_games/screens/game/bloc/game_bloc.dart';
import 'package:raw_games/screens/game/section/about_section.dart';
import 'package:raw_games/screens/game/section/rating_score_section.dart';
import 'package:raw_games/screens/game/section/release_section.dart';
import 'package:raw_games/utils/extensions/context_extension.dart';
import 'package:raw_games/utils/style/app_color.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';
import 'package:raw_games/widgets/adaptive_marquee_text.dart';
import 'package:raw_games/widgets/shimmer_box.dart';

class GameScreen extends StatelessWidget {
  final int gameId;

  const GameScreen({Key? key, required this.gameId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameBloc()..add(FetchDetailEvent(gameId)),
      child: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          return Container(
            color: AppColor.primary,
            child: SafeArea(
              child: Scaffold(
                body: CustomScrollView(
                  slivers: [
                    _GameAppBar(isLoading: state.isLoading, item: state.item),
                    SliverToBoxAdapter(
                      child: state.item is GameDetailResponse
                          ? _GameDetailSection(
                              item: state.item as GameDetailResponse,
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  kToolbarHeight,
                              child: const Center(
                                child: CupertinoActivityIndicator(),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    // return const Text('Game Screen with id $gameId');
  }
}

class _GameDetailSection extends StatelessWidget {
  final GameDetailResponse item;

  const _GameDetailSection({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.paddingMedium),
      child: Column(
        children: [
          RatingScoreSection(item: item),
          const SizedBox(height: AppDimen.paddingLarge),
          AboutSection(item: item),
          const SizedBox(height: AppDimen.paddingLarge),
          ReleaseSection(item: item),
        ],
      ),
    );
  }
}

class _GameAppBar extends StatelessWidget {
  final bool isLoading;
  final GameDetailResponse? item;

  const _GameAppBar({
    Key? key,
    required this.isLoading,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item is GameDetailResponse && !isLoading) {
      final data = item as GameDetailResponse;
      final flexibleHeight = MediaQuery.of(context).size.height / 3;
      return SliverAppBar(
        expandedHeight: flexibleHeight,
        flexibleSpace: FlexibleSpaceBar(
          background: CachedNetworkImage(
            imageUrl: data.imageUrl,
            memCacheHeight: context.fitImageCache(flexibleHeight),
            fit: BoxFit.cover,
          ),
        ),
        floating: false,
        pinned: true,
        snap: false,
        centerTitle: true,
        title: AdaptiveMarqueeText(
          data.name,
          style: AppTextStyle.bold(
            color: Colors.white,
            size: AppDimen.fontLarge,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppDimen.paddingSmall),
            child: IconButton(
              onPressed: () {
                if(item?.website is! String) {
                  return;
                }

                // TODO(agung): Open on browser
              },
              icon: const Icon(
                FontAwesomeIcons.circleInfo,
                color: Colors.white,
                size: AppDimen.sizeIconMedium,
              ),
            ),
          )
        ],
      );
    }

    return SliverAppBar(
      backgroundColor: AppColor.primary,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Center(
          child: ShimmerBox(
            width: MediaQuery.of(context).size.width / 2,
            baseColor: Colors.transparent,
            backgroundColor: Colors.white10,
            padding: const EdgeInsets.symmetric(
              vertical: AppDimen.paddingSmall,
              horizontal: AppDimen.paddingMedium,
            ),
          ),
        ),
      ),
    );
  }
}
