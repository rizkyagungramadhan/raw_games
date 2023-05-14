import 'package:flutter/material.dart';
import 'package:raw_games/generated/l10n.dart';
import 'package:raw_games/utils/style/app_color.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';

class PaginationErrorView extends StatelessWidget {
  final VoidCallback? onRetry;

  const PaginationErrorView({Key? key, required this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.paddingMedium),
      child: Column(
        children: [
          Text(
            S.of(context).somethingErrorText,
            style: AppTextStyle.regular(),
            textAlign: TextAlign.center,
          ),
          if(onRetry != null)
          Padding(
            padding: const EdgeInsets.only(top: AppDimen.paddingMedium),
            child: ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
                ),
                foregroundColor: AppColor.primary,
              ),
              child: Text(
                S.of(context).retry,
                style: AppTextStyle.regular(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
