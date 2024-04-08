import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: blackColor,
      child: ListView(
        children: [
          const Text('Hello dear'),
          const Text('Hello emmma')
        ]
      ),
    );
  }
}