
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:flutter/material.dart';

extension ModifyText on Text{
  Text decorateText({
    required Color color, 
    required FontWeight fontWeight,
    required double fontSize, 
    int? maxLines,
    bool? controlOverflow, 
    bool? noCenterAlign,
  }) => Text(
    data ?? emptyString, 
    style: TextStyle(
      fontFamily: quickSandFont,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
    overflow: controlOverflow ?? false ? TextOverflow.ellipsis : null,
    maxLines: maxLines,
    softWrap: true,
    textAlign: noCenterAlign ?? false ? null : TextAlign.center,
  );
}