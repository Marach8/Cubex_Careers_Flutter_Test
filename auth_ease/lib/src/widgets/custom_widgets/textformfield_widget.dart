import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/extensions/decorate_textstyle.dart';
import 'package:flutter/material.dart';


class GenericTextFormField extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final Widget? leadingWidget, suffixIcon;
  final FocusNode? focusNode;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;

  const GenericTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.leadingWidget,
    this.obscureText,
    this.suffixIcon,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      maxLines: 1,
      focusNode: focusNode,
      cursorColor: blackColor,
      obscureText: obscureText ?? false,
      cursorWidth: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        isDense: true,
        labelStyle: const TextStyle().decorateTextStyle(
          color: blackColor.withOpacity(0.2),
          fontWeight: fontWeight4,
          fontSize: fontSize3half
        ),
        floatingLabelStyle: const TextStyle().decorateTextStyle(
          color: blackColor.withOpacity(0.6),
          fontWeight: fontWeight4,
          fontSize: fontSize4,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: blackColor
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: redColor
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: redColor
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: const TextStyle().decorateTextStyle(
          color: redColor,
          fontWeight: fontWeight4,
          fontSize: fontSize2half,
        ),
        errorMaxLines: 2,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: blackColor.withOpacity(0.1)
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(hintText),
        suffixIcon: suffixIcon,
        prefixIcon: leadingWidget
      ),
      style: const TextStyle().decorateTextStyle(
        color: blackColor.withOpacity(0.7),
        fontWeight: fontWeight5,
        fontSize: fontSize3half,
      ),
    );
  }
}
