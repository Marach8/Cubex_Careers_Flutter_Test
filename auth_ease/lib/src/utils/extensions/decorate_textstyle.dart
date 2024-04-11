import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:flutter/material.dart';

extension DecorateTextStyle on TextStyle{
  TextStyle decorateTextStyle({
    required Color color, 
    required FontWeight fontWeight,
    required double fontSize,
    bool? controlOverflow,
  }) => TextStyle(
    fontFamily: quickSandFont,
    color: color, 
    fontSize: fontSize,
    fontWeight: fontWeight,
    overflow: controlOverflow ?? false ? TextOverflow.ellipsis : null,
  );
}
