import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_response.dart';
import 'package:raw_games/common/exception/app_exception.dart';
import 'package:raw_games/generated/l10n.dart';
import 'package:raw_games/screens/game/bloc/game_bloc.dart';
import 'package:raw_games/screens/game/const/game_screen_const.dart';
import 'package:raw_games/utils/extensions/context_extension.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';
import 'package:raw_games/widgets/shimmer_box.dart';

class ScreenshotSection extends StatefulWidget {
  final int gameId;

  const ScreenshotSection({Key? key, required this.gameId}) : super(key: key);

  @override
  State<ScreenshotSection> createState() => _ScreenshotSectionState();
}

class _ScreenshotSectionState extends State<ScreenshotSection> {
  final PagingController<int, GameScreenshotResponse> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      if (pageKey == 1) return;
      context
          .read<GameBloc>()
          .add(FetchScreenshotEvent(gameId: widget.gameId, page: pageKey));
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageHeight = MediaQuery.of(context).size.height / 4;

    return BlocConsumer<GameBloc, GameState>(
      listener: (context, state) {
        if (state.error is AppException) {
          _pagingController.error = state.error;
        }

        _pagingController.value = PagingState(
          nextPageKey: state.isLastScreenshotPage ? null : state.screenshotPage,
          itemList: state.screenshots,
          error: state.error,
        );
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).screenshots,
              style: AppTextStyle.bold(size: AppDimen.fontLarge),
            ),
            const SizedBox(height: AppDimen.paddingLarge),
            PagedListView.separated(
              pagingController: _pagingController,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              builderDelegate:
                  PagedChildBuilderDelegate<GameScreenshotResponse>(
                itemBuilder: (context, item, index) {
                  return InkWell(
                    onTap: () {
                      return context
                          .read<GameBloc>()
                          .add(OpenDetailImageEvent(item));
                    },
                    child: Hero(
                      tag: item.id.toString(),
                      child: Container(
                        height: imageHeight,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            AppDimen.radiusMedium,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: AppDimen.radiusSmall,
                              offset: const Offset(5, 5),
                              color: Colors.grey.withOpacity(0.1),
                            )
                          ],
                        ),
                        child: CachedNetworkImage(
                          imageUrl: item.imageUrl,
                          memCacheHeight: context.fitImageCache(imageHeight),
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (_, __, ___) {
                            return ShimmerBox(height: imageHeight);
                          },
                        ),
                      ),
                    ),
                  );
                },
                firstPageProgressIndicatorBuilder: (context) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: GameScreenConst.shimmerTotalItem,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimen.paddingMedium,
                        ),
                        child: ShimmerBox(height: imageHeight),
                      );
                    },
                  );
                },
                newPageProgressIndicatorBuilder: (context) {
                  return const Padding(
                    padding: EdgeInsets.all(AppDimen.paddingMedium),
                    child: CupertinoActivityIndicator(),
                  );
                },
              ),
              separatorBuilder: (_, __) => const SizedBox(
                height: AppDimen.paddingMedium,
              ),
            ),
          ],
        );
      },
    );
  }
}
