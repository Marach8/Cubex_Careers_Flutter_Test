import 'package:another_flushbar/flushbar.dart';
import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/extensions/decorate_textstyle.dart';
import 'package:flutter/material.dart';

Future showFlushbar({
  required BuildContext context, 
  required String message
}) => Flushbar(
    messageText: IntrinsicWidth(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), 
            color: whiteColor,
            border: Border.all(
              color: blackColor,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            message, 
            style: const TextStyle().decorateTextStyle(
              color: blackColor,
              fontWeight: fontWeight6,
              fontSize: fontSize2half
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
    margin: const EdgeInsets.only( bottom: 200),
    duration: const Duration(seconds:3), 
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: transparentColor, 
    borderRadius: BorderRadius.circular(10),
  ).show(context);