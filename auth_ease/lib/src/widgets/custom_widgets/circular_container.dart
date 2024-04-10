import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';


class CustomCircularContainer extends StatelessWidget {
  final Widget? child;
  final double radius;
  final Color? color;

  const CustomCircularContainer({
    super.key,
    required this.radius,
    this.child,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:color ?? whiteColor.withOpacity(0.1)
      ),
      child: child,
    );
  }
}