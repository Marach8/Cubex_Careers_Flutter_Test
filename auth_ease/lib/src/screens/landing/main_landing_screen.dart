import 'package:auth_ease/src/screens/landing/sub_views/bottom_sheet_for_landing_screen.dart';
import 'package:auth_ease/src/screens/landing/sub_views/landing_screen_page_view.dart';
import 'package:auth_ease/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:flutter/material.dart';


class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenericAnnotatedRegion(
      changeStatusBarIconBrightness: true,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: LandingScreenPageView(),
            ),
            Expanded(
              flex: 1,
              child: BottomSheetForLandingScreen(),
            )
          ],
        ),
      ),
    );
  }
}