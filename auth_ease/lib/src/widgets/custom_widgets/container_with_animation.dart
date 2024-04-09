import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/functions/helper_functions.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ContainerWithAnimation extends StatefulWidget {
  final String text,
  imageString;

  const ContainerWithAnimation({
    super.key,
    required this.text,
    required this.imageString
  });

  @override
  State<ContainerWithAnimation> createState() => _ContainerWithAnimationState();
}

class _ContainerWithAnimationState extends State<ContainerWithAnimation> with 
SingleTickerProviderStateMixin{

  late AnimationController sizeController;
  late Animation<double> sizeAnimation;

  @override 
  void initState(){
    super.initState();
    sizeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    sizeAnimation = Tween<double> (
      begin: 0.0, end: 5.0
    ).animate(
      CurvedAnimation(
        parent: sizeController,
        curve: Curves.easeInOut
      )
    );
  }

  @override 
  void dispose(){
    sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sizeController.forward();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imageString),
          fit: BoxFit.cover
        )
      ),
      child: SizeTransition(
        sizeFactor: sizeAnimation,
        child: ScaleTransition(
          scale: sizeAnimation,
          child: Center(
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                color: blackColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  width: 0.1,
                  color: redColor,
                )
              ),
              child: GenericText(
                color: whiteColor,
                fontSize: fontSize1,
                fontWeight: fontWeight6,
                text: widget.text,
              ),
            ),
          ),
        )
      ),
    );
  }
}