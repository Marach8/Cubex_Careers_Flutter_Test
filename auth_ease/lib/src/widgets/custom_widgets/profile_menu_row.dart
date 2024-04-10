
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomProfileMenuRow extends StatelessWidget {
  final String field, fieldValue;
  final void Function() onTap;
  final IconData? icon;
  
  const CustomProfileMenuRow({
    super.key,
    required this.field,
    required this.fieldValue,
    required this.onTap,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children:[
            Expanded(
              flex: 3,
              child: GenericText(
                noCenterAlign: true,
                fontSize: fontSize2half,
                fontWeight: fontWeight7,
                text: field
              ),
            ),
            Expanded(
              flex: 5,
              child: GenericText(
                fontSize: fontSize3,
                fontWeight: fontWeight7,
                text: fieldValue
              ),
            ),
            Expanded(child: Icon(icon ?? Iconsax.arrow_right))
          ]
        ),
      ),
    );
  }
}