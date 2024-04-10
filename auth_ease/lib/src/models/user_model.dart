import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';

class UserDataModel{
  final String username,
  email,
  address,
  //password, 
  phoneNumber,
  dateTimeOfRegistration;
  final String? imageString;


  UserDataModel({
    required this.username,
    required this.email,
    //required this.password,
    required this.address,
    required this.phoneNumber,
    required this.imageString,
    required this.dateTimeOfRegistration
  }); 

  factory UserDataModel.fromJson({
    required Map<String, dynamic> json, 
  }) => UserDataModel(
      username: json[userNameString.toLowerCase()],
      email: json[emailString.toLowerCase()],
      //password: json[passwordString.toLowerCase()],
      address: json[addressString.toLowerCase()],
      phoneNumber: json[phoneNumberString.toLowerCase()],
      dateTimeOfRegistration: json[dateTimeOfSignUpString],
      imageString: json[profilePictureString.toLowerCase()]
    );
}