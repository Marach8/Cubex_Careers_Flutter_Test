import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';


class GenericTextButton extends StatelessWidget {
  final void Function() onTap;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String title;

  const GenericTextButton({
    super.key,
    required this.onTap,
    required this.title,
    this.fontSize,
    this.color,
    this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GenericText(
        color: color ?? blackColor,
        fontSize: fontSize ?? fontSize2half,
        fontWeight: fontWeight ?? fontWeight7,
        text: title
      ),
    );
  }
}