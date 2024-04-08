import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/strings.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TextAndDotsIndicatorWidget extends StatelessWidget {
  final ValueNotifier<int> valueNotifier;
  
  const TextAndDotsIndicatorWidget({
    super.key,
    required this.valueNotifier
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GenericText(
            color: whiteColor,
            fontSize: fontSize3,
            fontWeight: fontWeight5,
            text: introString,
          ),
          const Gap(10),

          ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (_, value, __) {
              return DotsIndicator(
                position: value,
                dotsCount: 5,
                decorator: DotsDecorator(
                  activeColor: redColor,
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: whiteColor,
                      width: 1
                    )
                  ),
                  activeSize: const Size(40, 8),
                  color: blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: whiteColor,
                      width: 1
                    )
                  )
                ),
              );
            },
          )
        ],
      ),
    );
  }
}