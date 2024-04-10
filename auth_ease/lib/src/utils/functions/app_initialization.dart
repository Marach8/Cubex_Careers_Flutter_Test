import 'package:auth_ease/src/screens/landing_screen/main_landing_screen.dart';
import 'package:auth_ease/src/screens/profile_screen/main_profile_page.dart';
import 'package:auth_ease/src/utils/constants/strings/api_strings_and_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Widget initializeApp() async{
//   const secureStorage = FlutterSecureStorage();
//   await secureStorage.read(key: token).then((authToken){
//     if(authToken == null){
//       return const LandingPageScreen();
//     }
//     else{
//       return const MainProfileScreen();
//     }
//   });
// }