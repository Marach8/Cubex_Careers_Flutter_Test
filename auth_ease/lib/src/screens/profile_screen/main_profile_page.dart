import 'package:auth_ease/src/screens/profile_screen/user_profile_view.dart';
import 'package:auth_ease/src/services/get_user_data_service.dart';
import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/ui_dialogs/loading_screen/loading_screen.dart';
import 'package:auth_ease/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:flutter/material.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingScreen = LoadingScreen();

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
                return const Center(child: Text('Could not fetch'),);
              }
            }
            else{
              return const Center(
                child: CircularProgressIndicator(
                  color: blackColor,
                )
              );
            }
          },
        ),
      ),
    );
  }
}