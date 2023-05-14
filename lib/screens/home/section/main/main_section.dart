import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:raw_games/api/repository/game/model/game_response.dart';
import 'package:raw_games/common/exception/app_exception.dart';
import 'package:raw_games/generated/l10n.dart';
import 'package:raw_games/screens/home/bloc/home_bloc.dart';
import 'package:raw_games/screens/home/const/home_screen_const.dart';
import 'package:raw_games/screens/home/section/main/widgets/home_grid_view.dart';
import 'package:raw_games/screens/home/section/main/widgets/home_list_view.dart';
import 'package:raw_games/utils/extensions/string_extension.dart';
import 'package:raw_games/utils/style/app_color.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';

class MainSection extends StatefulWidget {
  const MainSection({Key? key}) : super(key: key);

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  final PagingController<int, GameResponse> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      if (pageKey == 1) return;
      context.read<HomeBloc>().add(FetchEvent(page: pageKey));
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.error is AppException) {
          _pagingController.error = state.error;
        }

        _pagingController.value = PagingState(
          nextPageKey: state.isLastPage ? null : state.page,
          itemList: state.items,
          error: state.error,
        );
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppDimen.paddingMedium),
            Text(
              () {
                if (state.keyword.isNotNullOrEmpty &&
                    state.error == null &&
                    state.totalSearchResult > 0) {
                  String foundText = '${state.totalSearchResult} ';
                  foundText += state.totalSearchResult < 1
                      ? S.of(context).game
                      : S.of(context).games;

                  return S.of(context).mainSectionSearchTitle(
                      foundText, '\'${state.keyword.orEmpty}\'');
                }

                return S.of(context).mainSectionCTA;
              }(),
              style: AppTextStyle.bold(size: AppDimen.fontExtraLarge),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppDimen.paddingMedium),
            _ItemViewButton(activeViewType: state.itemViewType),
            const SizedBox(height: AppDimen.paddingMedium),
            Expanded(
              child: () {
                switch (state.itemViewType) {
                  case HomeItemViewType.grid:
                    return HomeGridView(pagingController: _pagingController);
                  case HomeItemViewType.list:
                    return HomeListView(pagingController: _pagingController);
                }
              }(),
            ),
          ],
        );
      },
    );
  }
}

class _ItemViewButton extends StatelessWidget {
  final HomeItemViewType activeViewType;

  const _ItemViewButton({Key? key, required this.activeViewType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppDimen.paddingMedium),
              bottomLeft: Radius.circular(AppDimen.paddingMedium),
            ),
            color: activeViewType == HomeItemViewType.grid
                ? AppColor.greyDark
                : AppColor.grey,
          ),
          child: GestureDetector(
            onTap: () {
              context
                  .read<HomeBloc>()
                  .add(const SwitchItemViewEvent(HomeItemViewType.grid));
            },
            child: const Padding(
              padding: EdgeInsets.all(AppDimen.paddingMedium),
              child: Icon(
                Icons.grid_view_rounded,
                size: AppDimen.sizeIconMedium,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(AppDimen.paddingMedium),
              bottomRight: Radius.circular(AppDimen.paddingMedium),
            ),
            color: activeViewType == HomeItemViewType.list
                ? AppColor.greyDark
                : AppColor.grey,
          ),
          child: GestureDetector(
            onTap: () {
              context
                  .read<HomeBloc>()
                  .add(const SwitchItemViewEvent(HomeItemViewType.list));
            },
            child: const Padding(
              padding: EdgeInsets.all(AppDimen.paddingMedium),
              child: Icon(
                Icons.list_rounded,
                size: AppDimen.sizeIconMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
