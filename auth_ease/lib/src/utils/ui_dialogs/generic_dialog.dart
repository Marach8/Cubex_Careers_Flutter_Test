import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';


Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title, 
  required String content,
  required Map<String, T?> options
}) => showDialog<T>(
  context: context,
  builder: (_) => AlertDialog(
    title: GenericText(
      text: title,
      color: whiteColor,
      fontWeight: fontWeight7, 
      fontSize: fontSize4, 
    ),
    content: GenericText(
      text: content,
      color: whiteColor,
      fontWeight: fontWeight5, 
      fontSize: fontSize3, 
    ),
    actions: options.keys.map((optionKey){
      final optionValue = options[optionKey];
      return TextButton(
        onPressed: () => optionValue == null ?
          Navigator.pop(context) 
          : Navigator.of(context).pop(optionValue),
        child: GenericText(
          text: optionKey,
          color: whiteColor,
          fontWeight: fontWeight7, 
          fontSize: fontSize2half, 
        ),       
      );
    }).toList(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
    scrollable: true,
    backgroundColor: blackColor.withOpacity(0.5)
  )
);