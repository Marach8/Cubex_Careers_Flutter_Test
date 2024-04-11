import 'dart:math' show pi;
import 'package:auth_ease/src/screens/authentication_screen/sign_in_screen.dart';
import 'package:auth_ease/src/screens/authentication_screen/sign_up_screen.dart';
import 'package:auth_ease/src/utils/constants/strings/png_images_string.dart';
import 'package:flutter/material.dart';

class SignInAndSignUpScreen extends StatefulWidget {
  const SignInAndSignUpScreen({super.key});

  @override
  State<SignInAndSignUpScreen> createState() => _SignInAndSignUpScreenState();
}

class _SignInAndSignUpScreenState extends State<SignInAndSignUpScreen> with TickerProviderStateMixin{
  late AnimationController signInController, signUpController;
  late Animation<double> signInAnimation, signUpAnimation;

  @override 
  void initState(){
    super.initState();
    signInController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    );

    signUpController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    );

    signInAnimation = Tween<double>(
      begin: 0, end: -pi/2
    ).animate(signInController);

    signUpAnimation = Tween<double>(
      begin: pi/2.7, end: 0
    ).animate(signUpController);
  }

  @override 
  void dispose(){
    signInController.dispose();
    signUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: Listenable.merge([signInController, signUpController]),
      builder: (_, __) => Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  universityJpg
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          Transform(
            alignment: Alignment.centerLeft,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(signInController.value * width)
              ..rotateY(signInAnimation.value),
            child: SignInScreen(
              controller1: signInController, 
              controller2: signUpController
            )
          ),
          Transform(
            alignment: Alignment.centerRight,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(-width + signUpController.value * width)
              ..rotateY(signUpAnimation.value),
            child: SignUpScreen(
              controller1: signInController, 
              controller2: signUpController
            )
          ),
        ]
      ),
    );
  }
}