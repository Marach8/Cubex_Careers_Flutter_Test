import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class AddPhotoWidget extends StatelessWidget {
  final String fileName;
  const AddPhotoWidget({
    super.key,
    required this.fileName
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: fileName == emptyString,
      replacement: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GenericText(
          color: blackColor,
          fontSize: fontSize3half,
          fontWeight: fontWeight4,
          text: fileName,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(15),
          GenericText(
            color: blackColor,
            fontSize: fontSize3half,
            fontWeight: fontWeight4,
            text: addPhotoString,
          ),
          Gap(10),
          Icon(Iconsax.camera),
          Gap(15),
        ]
      ),
    );
  }
}