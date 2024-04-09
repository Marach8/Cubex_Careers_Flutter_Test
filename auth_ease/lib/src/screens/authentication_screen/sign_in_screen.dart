import 'package:auth_ease/src/services/auth_service.dart';
import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:auth_ease/src/utils/functions/helper_functions.dart';
import 'package:auth_ease/src/utils/ui_dialogs/flushbar.dart';
import 'package:auth_ease/src/utils/ui_dialogs/loading_screen/loading_screen.dart';
import 'package:auth_ease/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/elevated_button_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/lottie_animation.dart';
import 'package:auth_ease/src/widgets/custom_widgets/rich_text_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/textbutton_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignInScreen extends StatefulWidget {
  final AnimationController controller1, controller2;

  const SignInScreen({
    super.key,
    required this.controller1,
    required this.controller2
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();

  late String email, password;
  late ValueNotifier<bool> passwordNotifier, 
  confirmPasswordNotifier;

  @override 
  void initState(){
    super.initState();
    passwordNotifier = ValueNotifier(false);
    confirmPasswordNotifier = ValueNotifier(false);
  }

  @override 
  void dispose(){
    passwordNotifier.dispose();
    confirmPasswordNotifier.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    final loadingScreen = LoadingScreen();

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
                  height: 180,
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
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.keyboard_arrow_left_sharp),
                        ),
                      ),
                      const GenericText(
                        fontSize: fontSize4,
                        fontWeight: fontWeight7,
                        text: welcomeBackString
                      ),
                      const GenericText(
                        fontSize: fontSize2half,
                        fontWeight: fontWeight4,
                        text: loginToAccountString
                      ),
                      const Gap(20),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            GenericTextFormField(
                              hintText: emailString,
                              onSaved: (value) => email = value!,
                              leadingWidget: const Icon(Icons.email_outlined),
                              validator: (value) => validateForm(value: value),
                            ),

                            const Gap(20),
                            ValueListenableBuilder(
                              valueListenable: passwordNotifier,
                              builder: (_, value, __){
                                return GenericTextFormField(
                                  hintText: passwordString,
                                  onSaved: (value) => password = value!,
                                  leadingWidget: const Icon(Icons.lock_outline_rounded),
                                  validator: (value) => validateForm(value: value),
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
                          ],
                        ),
                      ),
                      
                      const Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GenericTextButton(
                            onTap: (){},
                            title: rememberMeString
                          ),
                          GenericTextButton(
                            onTap: (){},
                            title: forgortPasswordString
                          )
                        ],
                      ),
                      const Gap(20),
                      GenericElevatedButton(
                        onPressed: () async{
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            loadingScreen.showOverlay(context: context, text: registeringString);
                              await AuthService().loginUser(
                                email: email.trim(),
                                password: password.trim(),
                              ).then((registrationResult) async{
                                loadingScreen.hideOverlay();
                                await showFlushbar(context: context, message: registrationResult);
                              });
                          }

                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const HomeScreen()
                          //   )
                          // );
                        },
                        title: signInString,
                        backgroundColor: redColor,
                        color: whiteColor,
                      ),
                      const Gap(40),
                      RichTextWidget(
                        children: [
                          noAccountString,
                          [
                            signUpString,
                            redColor,
                            (){
                              widget.controller1.forward();
                              widget.controller2.forward();
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