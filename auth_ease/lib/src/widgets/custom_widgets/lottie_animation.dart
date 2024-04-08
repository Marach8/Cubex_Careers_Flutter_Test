import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GenericLottieAnimation extends StatelessWidget {
  final String lottiePath;
  final double? height, width;
  
  const GenericLottieAnimation({
    super.key,
    required this.lottiePath,
    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottiePath,
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}