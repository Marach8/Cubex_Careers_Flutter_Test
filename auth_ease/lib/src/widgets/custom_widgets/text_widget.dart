import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/extensions/decorate_text.dart';
import 'package:flutter/material.dart';

class GenericText extends StatelessWidget {
  final Color? color;
  final double fontSize;
  final int? maxLines;
  final FontWeight fontWeight;
  final String text;
  final bool? noCenterAlign, controlOverflow;

  const GenericText({
    super.key,
    this.color,
    this.noCenterAlign,
    this.controlOverflow,
    this.maxLines,
    required this.fontSize,
    required this.fontWeight,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(text).decorateText(
      controlOverflow: controlOverflow,
      noCenterAlign: noCenterAlign,
      color: color ?? blackColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
      maxLines: maxLines
    );
  }
}