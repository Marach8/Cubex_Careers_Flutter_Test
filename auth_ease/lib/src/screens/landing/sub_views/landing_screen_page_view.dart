import 'dart:async' show Timer;
import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/strings.dart';
import 'package:auth_ease/src/widgets/custom_widgets/container_with_animation.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LandingScreenPageView extends StatefulWidget {
  const LandingScreenPageView({super.key});

  @override
  State<LandingScreenPageView> createState() => _LandingScreenPageView();
}

class _LandingScreenPageView extends State<LandingScreenPageView> {
  late PageController pageController;
  late ValueNotifier<int> valueNotifier;
  late Timer timer;

  @override 
  void initState(){
    super.initState();
    pageController = PageController(initialPage: 0);
    valueNotifier = ValueNotifier<int>(0);
    timer = Timer.periodic(
      const Duration(seconds: 5), 
      (timer) {
        if(pageController.page == 4.0){
          pageController.animateToPage(
            0,
            duration: const Duration(seconds: 3),
            curve: Curves.decelerate
          );
        }
        else{
          pageController.nextPage(
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate
          );
        }
      }
    );
  }

  @override 
  void dispose(){
    pageController.dispose();
    valueNotifier.dispose();
    timer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: PageView(
            onPageChanged: (pageIndex) => valueNotifier.value = pageIndex,
            controller: pageController,
            children: const [
              ContainerWithAnimation(
                text: text1,
                imageString: universityJpg
              ),
              ContainerWithAnimation(
                text: text2,
                imageString: threePeople1Jpg
              ),
              ContainerWithAnimation(
                text: text3,
                imageString: onePersonJpg
              ),
              ContainerWithAnimation(
                text: text4,
                imageString: twoPeopleJpg
              ),
              ContainerWithAnimation(
                text: text5,
                imageString: manyPeopleJpg
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GenericText(
                  noCenterAlign: true,
                  color: whiteColor,
                  fontSize: fontSize3,
                  fontWeight: fontWeight5,
                  text: introString,
                ),
                const GenericText(
                  noCenterAlign: true,
                  color: whiteColor,
                  fontSize: fontSize3,
                  fontWeight: fontWeight5,
                  text: introString2,
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
                          borderRadius: BorderRadius.circular(5)
                        ),
                        activeSize: const Size(20, 8),
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
          ),
        ),
      ],
    );
  }
}