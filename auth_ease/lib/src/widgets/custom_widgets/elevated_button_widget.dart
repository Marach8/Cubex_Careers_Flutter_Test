import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/fontsizes.dart';


class GenericElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color? color, 
  backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;

  const GenericElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.margin,
    this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            backgroundColor ?? blackColor
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              width: 1, 
              strokeAlign: 1, 
              color: color ?? blackColor
            )
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          )
        ),
        child: GenericText(
          color: color,
          fontSize: fontSize ?? fontSize3,
          fontWeight: fontWeight ?? fontWeight5,
          text: title
        )
      ),
    );
  }
}