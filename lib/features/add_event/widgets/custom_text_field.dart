import 'package:flutter/material.dart';
import 'package:new_todo_app/constants/theme/app_colors.dart';
import 'package:new_todo_app/constants/utils/app_utils.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final String? errorText;
  final bool showError;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final int? maxLines;
  final int? minLines;
  final String? titleText;
  final Function(String?)? onChanged;
  final Function()? onEditingComplete;
  final bool? obscureText;
  final bool readOnly;
  final Color? fillColor;
  final bool? enabled;
  final Function()? onTap;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    this.title,
    this.hintText,
    this.errorText,
    this.showError = false,
    required this.controller,
    this.keyboardType,
    this.inputAction,
    this.maxLines,
    this.onChanged,
    this.obscureText,
    this.suffixIcon,
    this.titleText,
    this.enabled,
    this.onTap,
    this.readOnly = false,
    this.fillColor,
    this.minLines,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('$title'),
        AppUtils.kBoxHeight4,
        TextFormField(
          readOnly: readOnly,
          enabled: enabled ?? true,
          obscureText: obscureText ?? false,
          controller: controller,
          onTap: onTap,
          // style: AppStyles.blackSemiBold17,
          textInputAction: inputAction ?? TextInputAction.next,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            // prefixStyle: AppStyles.semiBoldBlack15,
            suffixIcon: suffixIcon,
            labelText: titleText,
            contentPadding: AppUtils.kHorizontal13Vertical9Padding,
            filled: true,
            fillColor: fillColor ?? AppColors.grey100,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: fillColor ?? AppColors.mainBlue),
              borderRadius: AppUtils.kBorderRadius8,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: fillColor ?? AppColors.grey100,
              ),
              borderRadius: AppUtils.kBorderRadius8,
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey100,
              ),
              borderRadius: AppUtils.kBorderRadius8,
            ),
            errorText: showError ? errorText : null,
            hintText: hintText,
            // hintStyle: AppStyles.greyBDText15,
          ),
          cursorColor: AppColors.mainBlue,
          keyboardType: keyboardType,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          // scrollPhysics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
