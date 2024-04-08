import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/extensions/decorate_textspan.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class RichTextWidget extends StatelessWidget {
  final List<dynamic> children;

  const RichTextWidget({
    super.key,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: children.map(
            (child) {
              if(child is List){
                final text = child.first as String;
                final color = child[1] as Color;
                final function = child.last as void Function();
      
                return TextSpan(
                  text: text,
                  recognizer: TapGestureRecognizer()..onTap = function,
                ).decorateTextSpan(
                  color: color,
                  fontWeight: fontWeight7,
                  fontSize: fontSize3
                );
              }
      
              return TextSpan(
                text: child as String
              ).decorateTextSpan(
                color: blackColor,
                fontWeight: fontWeight3,
                fontSize: fontSize3
              );
            }
          ).toList()
        )
      ),
    );
  }
}
