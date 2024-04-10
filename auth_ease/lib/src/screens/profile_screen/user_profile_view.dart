import 'package:auth_ease/src/models/user_model.dart';
import 'package:auth_ease/src/screens/authentication_screen/combined_animated_auth_screen.dart';
import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/maps.dart';
import 'package:auth_ease/src/utils/constants/strings/api_strings_and_urls.dart';
import 'package:auth_ease/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:auth_ease/src/utils/functions/decode_image_string.dart';
import 'package:auth_ease/src/utils/ui_dialogs/flushbar.dart';
import 'package:auth_ease/src/utils/ui_dialogs/generic_dialog.dart';
import 'package:auth_ease/src/utils/ui_dialogs/loading_screen/loading_screen.dart';
import 'package:auth_ease/src/widgets/custom_widgets/circular_container.dart';
import 'package:auth_ease/src/widgets/custom_widgets/lottie_animation.dart';
import 'package:auth_ease/src/widgets/custom_widgets/profile_menu_row.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/textbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';


class UserProfileView extends StatelessWidget {
  final UserDataModel userData;

  const UserProfileView ({
    super.key,
    required this.userData
  });

  @override
  Widget build(BuildContext context) {
    final imageBytes = decodeImageString(imageString: userData.imageString!);

    return Scaffold(
      appBar: AppBar(
        title: const GenericText(
          fontSize: fontSize4,
          fontWeight: fontWeight7,
          text: profileString
        ),
        backgroundColor: whiteColor,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CustomCircularContainer(
                  radius: 200,
                  child: imageBytes == null ? 
                    const GenericLottieAnimation(lottieString: displayPictureLottie,) :
                    Image.memory(
                      imageBytes,
                      fit: BoxFit.cover,
                    )
                ),
              ),
              const Gap(10),
              const Divider(),
              const Gap(10),
              const GenericText(
                fontSize: fontSize4,
                fontWeight: fontWeight7,
                text: profileInformationString
              ),
              const Gap(20),
              CustomProfileMenuRow(
                field: userNameString,
                fieldValue: userData.username,
                onTap: (){},
              ),
              CustomProfileMenuRow(
                field: emailString,
                fieldValue: userData.email,
                onTap: (){},
              ),
              CustomProfileMenuRow(
                field: phoneNumberString,
                fieldValue: userData.phoneNumber,
                onTap: (){},
              ),
              CustomProfileMenuRow(
                field: addressString,
                fieldValue: userData.address,
                onTap: (){},
              ),
              CustomProfileMenuRow(
                field: dateTimeOfSignUpString,
                fieldValue: userData.dateTimeOfRegistration,
                onTap: (){},
              ),
              const Divider(),
              const Gap(10),
              Align(
                alignment: Alignment.center,
                child: GenericTextButton(
                  onTap: () async{
                    await showGenericDialog(
                      context: context,
                      title: logoutString,
                      content: confirmLogoutString,
                      options: queryMap
                    ).then((result) async{
                      if(result ?? false){
                        final loadingScreen = LoadingScreen();
                        loadingScreen.showOverlay(context: context, text: logginOutString);
                        const  secureStorage = FlutterSecureStorage();
                        await secureStorage.delete(key: token).then((_) async{
                          loadingScreen.hideOverlay();
                          await showFlushbar(
                            context: context, message: authSuccessString
                          ).then((_) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInAndSignUpScreen()
                              )
                            )
                          );
                        });
                      }
                    });
                  },
                  color: redColor,
                  fontSize: fontSize4,
                  fontWeight: fontWeight7,
                  title: logoutString
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}