import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenericAnnotatedRegion extends StatelessWidget {
  final Widget child;
  final bool? changeStatusBarIconBrightness;

  const GenericAnnotatedRegion({
    super.key,
    required this.child,
    this.changeStatusBarIconBrightness
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: whiteColor,
        statusBarColor: transparentColor,
        statusBarIconBrightness: changeStatusBarIconBrightness ?? false
          ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark
      ),
      child: child
    );
  }
}