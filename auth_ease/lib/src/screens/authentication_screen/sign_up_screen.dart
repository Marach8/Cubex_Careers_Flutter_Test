import 'package:auth_ease/src/screens/authentication_screen/sub_widgets/add_photo_widget.dart';
import 'package:auth_ease/src/services/auth_service.dart';
import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:auth_ease/src/utils/functions/helper_functions.dart';
import 'package:auth_ease/src/utils/functions/pick_profile_photo.dart';
import 'package:auth_ease/src/utils/ui_dialogs/flushbar.dart';
import 'package:auth_ease/src/utils/ui_dialogs/loading_screen/loading_screen.dart';
import 'package:auth_ease/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/elevated_button_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/lottie_animation.dart';
import 'package:auth_ease/src/widgets/custom_widgets/rich_text_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:developer' as marach show log;


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
  late String username, email,
  phoneNumber, address,
  password, confirmPassword;

  final formKey = GlobalKey<FormState>();
  late ValueNotifier<bool> passwordNotifier, 
  confirmPasswordNotifier;
  late ValueNotifier<String> fileNameNotifier;

  String userImageString = emptyString;

  @override 
  void initState(){
    super.initState();
    passwordNotifier = ValueNotifier(false);
    confirmPasswordNotifier = ValueNotifier(false);
    fileNameNotifier = ValueNotifier(emptyString);
  }

  @override 
  void dispose(){
    passwordNotifier.dispose();
    confirmPasswordNotifier.dispose();
    fileNameNotifier.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    final loadinScreen = LoadingScreen();

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
                        child: Column(
                          children: [
                            GenericTextFormField(
                              hintText: userNameString,
                              validator: (value) => validateForm(value: value),
                              onSaved: (value) => username = value!,
                              leadingWidget: const Icon(Iconsax.user),
                            ),
                            const Gap(15),
                            GenericTextFormField(
                              hintText: emailString,
                              validator: (value) => validateForm(
                                value: value, 
                                specialEmailCheck: true
                              ),
                              onSaved: (value) => email = value!,
                              leadingWidget: const Icon(Icons.email_outlined),
                            ),
                            const Gap(15),
                            GenericTextFormField(
                              hintText: phoneNumberString,
                              validator: (value) => validateForm(value: value),
                              onSaved: (value) => phoneNumber = value!,
                              leadingWidget: const Icon(Icons.phone_outlined),
                            ),
                            const Gap(15),
                            GenericTextFormField(
                              hintText: addressString,
                              validator: (value) => validateForm(value: value),
                              onSaved: (value) => address = value!,
                              leadingWidget: const Icon(Iconsax.home),
                            ),
                            const Gap(15),

                            ValueListenableBuilder(
                              valueListenable: passwordNotifier,
                              builder: (_, value, __){
                                return GenericTextFormField(
                                  hintText: passwordString,
                                  validator: (value) => validateForm(
                                    value :value,
                                    specialpasswordCheck: true
                                  ),
                                  onSaved: (value) => password = value!,
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
                                return GenericTextFormField(
                                  hintText: confirmPasswordString,
                                  validator: (value) => validateForm(value: value),
                                  onSaved: (value) => confirmPassword = value!,
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
                          ],
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
                        onPressed: () async{

                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            marach.log('userImageString is $userImageString');
                            
                            if(password.trim() == confirmPassword.trim()){
                              loadinScreen.showOverlay(context: context, text: registeringString);
                              await AuthService().registerNewUser(
                                username: username.trim(),
                                email: email.trim(),
                                password: password.trim(),
                                address: address.trim(),
                                phoneNumber: phoneNumber.trim(),
                                imageString: userImageString
                              ).then((registrationResult) async{
                                loadinScreen.hideOverlay();
                                marach.log(registrationResult);
                                await showFlushbar(context: context, message: registrationResult);
                              });
                            }
                            //Password and confirmPassword do not match
                            else{
                              showFlushbar(context: context, message: unmatchedPasswordString);
                            }
                          }
                        },

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