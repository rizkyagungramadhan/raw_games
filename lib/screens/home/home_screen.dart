import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raw_games/generated/l10n.dart';
import 'package:raw_games/screens/home/bloc/home_bloc.dart';
import 'package:raw_games/screens/home/section/main/main_section.dart';
import 'package:raw_games/utils/style/app_color.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/widgets/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchTextController = TextEditingController();

    return BlocProvider(
      create: (context) => HomeBloc()..add(const FetchEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: RefreshIndicator(
              backgroundColor: Colors.white,
              color: AppColor.primary,
              onRefresh: () async {
                context.read<HomeBloc>().add(const FetchEvent());
              },
              child: Padding(
                padding: const EdgeInsets.all(AppDimen.paddingMedium),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    SearchTextField(
                      key: const Key('searchTextField'),
                      controller: searchTextController,
                      placeholder: S.of(context).searchPlaceholder,
                      onSearch: (keyword) {
                        context
                            .read<HomeBloc>()
                            .add(SearchEvent(keyword: keyword));
                      },
                    ),
                    const Expanded(child: MainSection()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
