import 'package:flutter/material.dart';
import 'package:raw_games/utils/style/app_color.dart';
import 'package:raw_games/utils/style/app_dimen.dart';
import 'package:raw_games/utils/style/app_text_style.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String placeholder;
  final ValueChanged<String>? onSearch;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;

  const SearchTextField({
    this.controller,
    required this.placeholder,
    this.onSearch,
    this.onChanged,
    this.suffixIcon,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            blurRadius: AppDimen.radiusSmall,
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: TextFormField(
        style: AppTextStyle.regular(),
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onSearch,
        textInputAction: textInputAction ?? TextInputAction.search,
        decoration: InputDecoration(
          isDense: true,
          hintText: placeholder,
          hintStyle: AppTextStyle.light(color: Colors.black26),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColor.grey,
          errorStyle: AppTextStyle.light(color: Colors.redAccent),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
            borderSide: const BorderSide(color: Colors.red),
          ),
          suffixIcon: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimen.paddingMedium),
            child: suffixIcon ??
                const Icon(
                  Icons.search,
                  color: Colors.black45,
                ),
          ),
          suffixIconConstraints: const BoxConstraints(
            maxHeight: AppDimen.sizeIconExtraLarge * 2,
            maxWidth: AppDimen.sizeIconExtraLarge * 2,
          ),
        ),
      ),
    );
  }
}
