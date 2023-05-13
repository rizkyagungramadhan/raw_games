import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';
import 'package:raw_games/screens/home/const/home_const.dart';
import 'package:raw_games/screens/home/section/main/widgets/home_list_card.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/widgets/shimmer_box.dart';

class HomeListView extends StatelessWidget {
  final PagingController<int, GameResponse> pagingController;

  const HomeListView({Key? key, required this.pagingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagedListView.separated(
      pagingController: pagingController,
      shrinkWrap: true,
      builderDelegate: PagedChildBuilderDelegate<GameResponse>(
        itemBuilder: (context, item, index) {
          return HomeListCard(item: item);
        },
        firstPageProgressIndicatorBuilder: (context) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: HomeConst.shimmerTotalItem,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(
                  bottom: AppDimen.paddingMedium,
                ),
                child: ShimmerBox(height: HomeConst.shimmerGridHeight),
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
    );
  }
}
