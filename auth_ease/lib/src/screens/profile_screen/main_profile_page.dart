import 'package:auth_ease/src/screens/profile_screen/fall_back_view.dart';
import 'package:auth_ease/src/screens/profile_screen/user_profile_view.dart';
import 'package:auth_ease/src/services/get_user_data_service.dart';
import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:auth_ease/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/lottie_animation.dart';
import 'package:flutter/material.dart';

class MainProfileScreen extends StatefulWidget {
  const MainProfileScreen({super.key});

  @override
  State<MainProfileScreen> createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GenericAnnotatedRegion(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: FutureBuilder(
          future: fetchUserData(),
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
        
              if(snapshot.hasData && snapshot.data != null){
                final userData = snapshot.data!;
                return UserProfileView(userData: userData);
              }
              else{
                return FallBackView(
                  onPressed: () => setState((){}),
                );
              }
            }
            else{
              return const Center(
                child: GenericLottieAnimation(lottieString: loadingLottie),
              );
            }
          },
        ),
      ),
    );
  }
}