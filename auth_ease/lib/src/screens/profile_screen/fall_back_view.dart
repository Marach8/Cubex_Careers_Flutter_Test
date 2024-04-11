import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:auth_ease/src/widgets/custom_widgets/elevated_button_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/lottie_animation.dart';
import 'package:flutter/material.dart';

class FallBackView extends StatelessWidget {
  final void Function() onPressed;

  const FallBackView({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const GenericLottieAnimation(lottieString: dataNotFoundLottie),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: GenericElevatedButton(
                color: whiteColor,
                fontWeight: fontWeight7,
                onPressed: onPressed,
                title: refreshString
              ),
            ),
          )
        ],
      ),
    );
  }
}