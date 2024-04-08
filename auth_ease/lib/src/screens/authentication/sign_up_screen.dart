import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/strings.dart';
import 'package:auth_ease/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/elevated_button_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/lottie_animation.dart';
import 'package:auth_ease/src/widgets/custom_widgets/rich_text_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/textfield_widget.dart';
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
  late TextEditingController emailController,
  passwordController, confirmPasswordController,
  usernameController;

  late ValueNotifier<bool> passwordNotifier, 
  confirmPasswordNotifier;

  @override 
  void initState(){
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordNotifier = ValueNotifier(false);
    confirmPasswordNotifier = ValueNotifier(false);
  }

  @override 
  void dispose(){
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordNotifier.dispose();
    confirmPasswordNotifier.dispose();
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
                      GenericTextField(
                        hintText: userNameString,
                        controller: usernameController,
                        leadingWidget: const Icon(Icons.person),
                      ),
                      const Gap(15),
                      GenericTextField(
                        hintText: emailString,
                        controller: emailController,
                        leadingWidget: const Icon(Icons.email_outlined),
                      ),
                      const Gap(15),
                      ValueListenableBuilder(
                        valueListenable: passwordNotifier,
                        builder: (_, value, __){
                          return GenericTextField(
                            hintText: passwordString,
                            controller: passwordController,
                            leadingWidget: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              onPressed: () => passwordNotifier.value = !passwordNotifier.value,
                              icon: Visibility(
                                visible: value,
                                replacement: const Icon(Icons.visibility_rounded),
                                child: const Icon(Icons.visibility_off_rounded),
                              ),
                            ),
                            obscureText: value ? false : true,
                          );
                        },
                      ),
                      const Gap(15),
                      ValueListenableBuilder(
                        valueListenable: confirmPasswordNotifier,
                        builder: (_, value, __){
                          return GenericTextField(
                            hintText: confirmPasswordString,
                            controller: confirmPasswordController,
                            leadingWidget: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              onPressed: () => confirmPasswordNotifier.value = !confirmPasswordNotifier.value,
                              icon: Visibility(
                                visible: value,
                                replacement: const Icon(Icons.visibility_rounded),
                                child: const Icon(Icons.visibility_off_rounded),
                              ),
                            ),
                            obscureText: value ? false : true,
                          );
                        },
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