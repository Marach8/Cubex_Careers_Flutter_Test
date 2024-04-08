import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/extensions/decorate_text.dart';
import 'package:flutter/material.dart';


Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title, 
  required String content,
  required Map<String, T?> options
}) => showDialog<T>(
  context: context,
  builder: (_) => AlertDialog(
    title: Center(
      child: Text(title).decorateText(
        color: whiteColor,
        fontWeight: fontWeight5, 
        fontSize: fontSize4, 
      ),
    ),
    content: Center(
      child: Text(content).decorateText(
        color: whiteColor,
        fontWeight: fontWeight3, 
        fontSize: fontSize2, 
      ),
    ),
    actions: options.keys.map((optionKey){
      final optionValue = options[optionKey];
      return TextButton(
        onPressed: () => optionValue == null ?
          Navigator.pop(context) 
          : Navigator.of(context).pop(optionValue),
        child: Text(optionKey).decorateText(
          color: whiteColor,
        fontWeight: fontWeight7, 
        fontSize: fontSize2,  
        ),        
      );
    }).toList(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
    scrollable: true,
    backgroundColor: blackColor 
  )
);