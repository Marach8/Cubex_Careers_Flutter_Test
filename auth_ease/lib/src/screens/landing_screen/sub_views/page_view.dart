import 'dart:async' show Timer;
import 'package:auth_ease/src/screens/landing_screen/widgets/text_and_dots_indicator_widget.dart';
import 'package:auth_ease/src/utils/constants/strings/png_images_string.dart';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:auth_ease/src/widgets/custom_widgets/container_with_animation.dart';
import 'package:flutter/material.dart';

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
      (_) {
        if(pageController.page == 4.0){
          pageController.jumpToPage(0);
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
          child: TextAndDotsIndicatorWidget(
            valueNotifier: valueNotifier,
            pageController: pageController
          ),
        ),
      ],
    );
  }
}