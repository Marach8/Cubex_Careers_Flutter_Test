import 'package:auth_ease/src/screens/profile_screen/main_profile_page.dart';
import 'package:auth_ease/src/services/auth_service.dart';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:auth_ease/src/utils/ui_dialogs/flushbar.dart';
import 'package:auth_ease/src/utils/ui_dialogs/loading_screen/loading_screen.dart';
import 'package:flutter/material.dart';

Future<void> signInUser({
  required BuildContext context,
  required String username,
  required String password
}) async{
  final loadingScreen = LoadingScreen();
  loadingScreen.showOverlay(context: context, text: loggingInString);
    await AuthService().authLogin(
      username: username.trim(),
      password: password.trim(),
    ).then((loginResult) async{
      loadingScreen.hideOverlay();
      await showFlushbar(
        context: context,
        message: loginResult
      ).then((_){
        if(loginResult == authSuccessString){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainProfileScreen()
            )
          );
        }
      });
    });
}
