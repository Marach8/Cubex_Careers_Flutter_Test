import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GenericLottieAnimation extends StatelessWidget {
  final String lottieString;
  final double? height, width;
  
  const GenericLottieAnimation({
    super.key,
    required this.lottieString,
    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottieString,
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}