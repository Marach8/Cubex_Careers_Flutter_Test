import 'package:auth_ease/src/screens/authentication/combined_animated_auth_screen.dart';
import 'package:auth_ease/src/screens/landing/main_landing_screen.dart';
import 'package:flutter/material.dart';

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
      home: const LandingPageScreen(),
    );
  }
}