import 'package:auth_ease/src/screens/authentication_screen/combined_animated_auth_screen.dart';
import 'package:auth_ease/src/screens/landing_screen/main_landing_screen.dart';
import 'package:auth_ease/src/screens/profile_screen/main_profile_page.dart';
import 'package:auth_ease/src/utils/constants/strings/api_strings_and_urls.dart';
import 'package:auth_ease/src/utils/constants/strings/png_images_string.dart';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:auth_ease/src/widgets/custom_widgets/container_with_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light
      ),
      home: FutureBuilder(
        future: const FlutterSecureStorage().read(key: token),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData && snapshot.data != null){
              return const MainProfileScreen();
            }
            else{
              return const LandingPageScreen();
            }
          }
          else{
            return const LandingPageScreen();
          }          
        }
      ),
    );
  }
}