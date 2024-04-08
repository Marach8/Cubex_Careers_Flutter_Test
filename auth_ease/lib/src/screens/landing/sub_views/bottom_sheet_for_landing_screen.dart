import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/strings.dart';
import 'package:auth_ease/src/widgets/custom_widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomSheetForLandingScreen extends StatelessWidget {
  const BottomSheetForLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return BottomSheet(
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.3,
        maxWidth: screenWidth
      ),
      elevation: 0,
      onClosing: (){},
      builder: (context){
        return SizedBox(
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(30),
                GenericElevatedButton(
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: whiteColor,
                  fontSize: fontSize4,
                  backgroundColor: redColor,
                  onPressed: (){},
                  title: getStartedString
                ),
                const Gap(15),
                GenericElevatedButton(
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  fontWeight: fontWeight7,
                  fontSize: fontSize4,
                  backgroundColor: whiteColor,
                  color: redColor,
                  onPressed: (){},
                  title: signUpString
                ),
                const Gap(90)
              ]
            ),
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),
    );
  }
}