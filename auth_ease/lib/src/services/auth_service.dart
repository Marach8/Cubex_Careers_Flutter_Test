import 'dart:convert';
import 'package:auth_ease/src/utils/constants/strings/api_strings_and_urls.dart';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class AuthService{
  AuthService._sharedInstance();
  static final AuthService _shared = AuthService._sharedInstance();
  factory AuthService() => _shared;
  final secureStorage = const FlutterSecureStorage();

  Future<String> authRegister({
    required String username,
    required String email,
    required String password,
    required String address,
    required String phoneNumber,
    required String imageString,
  }) async{

    final userPayload = {
      userNameString.toLowerCase(): username,
      emailString.toLowerCase(): email,
      passwordString.toLowerCase(): password,
      addressString.toLowerCase(): address,
      phoneNumberString.toLowerCase(): phoneNumber,
      dateTimeOfSignUpString : DateFormat(dateFormatString).format(DateTime.now()),
      profilePictureString.toLowerCase(): imageString,
    };
    
    final url = Uri.parse(signUpEndPoint);

    try{
      final response = await http.post(
        url,
        body: jsonEncode(userPayload),
        headers: {
          contentType: jsonFormat,
          accept: jsonFormat
        }
      );

      if(response.statusCode == 201){
        return authSuccessString;
      }

      else if(response.statusCode == 409){
        return authFailureString + tryAnotherUsernameString;
      }

      else{
        return authFailureString;
      }
    }

    catch (_){
      return errorString;
    }
  }


  Future<String> authLogin({
    required String username,
    required String password
  }) async{
    final userPayload = {
      userNameString.toLowerCase(): username,
      passwordString.toLowerCase(): password,
    };
    
    final url = Uri.parse(signInEndPoint);

    try{
      final response = await http.post(
        url,
        body: jsonEncode(userPayload),
        headers: {
          contentType: jsonFormat,
          accept: jsonFormat
        }
      );

      if(response.statusCode == 200){
        final jsonData = jsonDecode(response.body);
        final authToken = jsonData[token];
        await secureStorage.write(key: token, value: authToken);
        return authSuccessString;
      }

      else if(response.statusCode == 400){
        return ensureLoginWithUsernameString;
      }

      else{
        return authFailureString;
      }
    }

    catch (_){
      return errorString;
    }
  }
}