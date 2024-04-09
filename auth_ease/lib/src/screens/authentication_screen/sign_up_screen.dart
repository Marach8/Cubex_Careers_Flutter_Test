import 'package:auth_ease/src/screens/authentication_screen/sub_widgets/add_photo_widget.dart';
import 'package:auth_ease/src/screens/authentication_screen/sub_widgets/signup_form.dart';
import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:auth_ease/src/utils/functions/pick_profile_photo.dart';
import 'package:auth_ease/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/elevated_button_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/lottie_animation.dart';
import 'package:auth_ease/src/widgets/custom_widgets/rich_text_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class SignUpScreen extends StatefulWidget {
  final AnimationController controller1, controller2;

  const SignUpScreen({
    super.key,
    required this.controller1,
    required this.controller2
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // late TextEditingController emailController,
  // passwordController, confirmPasswordController,
  // usernameController, addressController,
  // phoneNumberController;
  final formKey = GlobalKey<FormState>();
  late ValueNotifier<bool> passwordNotifier, 
  confirmPasswordNotifier;
  late ValueNotifier<String> fileNameNotifier;

  String? userImageString;

  @override 
  void initState(){
    super.initState();
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // addressController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordController = TextEditingController();
    // confirmPasswordController = TextEditingController();
    passwordNotifier = ValueNotifier(false);
    confirmPasswordNotifier = ValueNotifier(false);
    fileNameNotifier = ValueNotifier(emptyString);
  }

  @override 
  void dispose(){
    // usernameController.dispose();
    // emailController.dispose();
    // addressController.dispose();
    // phoneNumberController.dispose();
    // passwordController.dispose();
    // confirmPasswordController.dispose();
    passwordNotifier.dispose();
    confirmPasswordNotifier.dispose();
    fileNameNotifier.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return GenericAnnotatedRegion(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                spreadRadius: 5,
                color: blackColor.withOpacity(0.1)
              )
            ]
          ),
          child: Card(
            color: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            margin: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const GenericLottieAnimation(
                  lottiePath: bikeRiderLottie,
                  height: 150,
                ),
                
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                  decoration: BoxDecoration(
                    color: redColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: whiteColor,
                      width: 2,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: (){},
                          child: const Icon(Icons.keyboard_arrow_left_sharp),
                        ),
                      ),
                      const GenericText(
                        fontSize: fontSize4,
                        fontWeight: fontWeight7,
                        text: letsGetStartedString
                      ),
                      const GenericText(
                        fontSize: fontSize2half,
                        fontWeight: fontWeight4,
                        text: createAccountString
                      ),

                      const Gap(15),

                      Form(
                        key: formKey,
                        child: FormFieldsWidget(
                          passwordNotifier: passwordNotifier,
                          confirmPasswordNotifier: confirmPasswordNotifier,
                        ),
                      ),

                      const Gap(15),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: ValueListenableBuilder(
                          valueListenable: fileNameNotifier,
                          builder: (_, fileName, __) => GestureDetector(
                            onTap: () async{
                              final pickedPhotoDetails = await pickProfilePhoto();
                              if(pickedPhotoDetails != null){
                                final imageFileName = pickedPhotoDetails.first;
                                final imageString = pickedPhotoDetails.last;
                                fileNameNotifier.value = imageFileName;
                                userImageString = imageString;
                              }
                            },
                            child: AddPhotoWidget(fileName: fileName)
                          ),
                        ),
                      ),

                      const Gap(15),

                      GenericElevatedButton(
                        onPressed: (){},
                        title: signUpString,
                        backgroundColor: redColor,
                        color: whiteColor,
                      ),
                      const Gap(40),
                      RichTextWidget(
                        children: [
                          haveAccountString,
                          [
                            signInString,
                            redColor,
                            (){
                              widget.controller1.reverse();
                              widget.controller2.reverse();
                            }
                          ]
                        ]
                      )
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}