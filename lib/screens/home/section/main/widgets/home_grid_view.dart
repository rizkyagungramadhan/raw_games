import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';
import 'package:raw_games/screens/home/const/home_screen_const.dart';
import 'package:raw_games/screens/home/section/main/widgets/home_grid_card.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/widgets/shimmer_box.dart';

class HomeGridView extends StatelessWidget {
  final PagingController<int, GameResponse> pagingController;

  const HomeGridView({Key? key, required this.pagingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagedGridView(
      padding: EdgeInsets.zero,
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<GameResponse>(
        itemBuilder: (context, item, index) => HomeGridCard(item: item),
        firstPageProgressIndicatorBuilder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppDimen.paddingMedium,
                crossAxisSpacing: AppDimen.paddingMedium,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: AppDimen.paddingMedium),
                  child: ShimmerBox(height: HomeScreenConst.shimmerGridHeight),
                );
              },
            ),
          );
        },
        newPageProgressIndicatorBuilder: (context) {
          return const Padding(
            padding: EdgeInsets.all(AppDimen.paddingMedium),
            child: CupertinoActivityIndicator(),
          );
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppDimen.paddingMedium,
        crossAxisSpacing: AppDimen.paddingMedium,
        childAspectRatio: 1,
      ),
    );
  }
}
