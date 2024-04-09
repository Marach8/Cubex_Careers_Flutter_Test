import 'package:auth_ease/src/models/user_model.dart';
import 'package:auth_ease/src/utils/constants/strings/api_strings_and_urls.dart';
import 'package:http/http.dart' as http;

class AuthService{
  AuthService._sharedInstance();
  static final AuthService _shared = AuthService._sharedInstance();
  factory AuthService() => _shared;

  Future<dynamic> registerNewUser({
    required String username,
    required String email,
    required String password,
    required String address,
    required String phoneNumber,
    required String imageString,
  }) async{

    final userPayload = UserPayload(
      username: username,
      email: email,
      password: password,
      address: address,
      phoneNumber: phoneNumber,
      profilePictureString: 'profilePictureString'
    );
    
    final url = await http.post(Uri.parse(signUpEndPoint));
  }

}