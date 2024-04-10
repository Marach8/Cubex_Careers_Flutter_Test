import 'dart:convert';
import 'package:auth_ease/src/models/user_model.dart';
import 'package:auth_ease/src/utils/constants/strings/api_strings_and_urls.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as marach show log;


Future<UserDataModel?> fetchUserData() async{
  final url = Uri.parse(userDataEndPoint);
  const secureStorage = FlutterSecureStorage();
  final requestToken = await secureStorage.read(key: token);

  try{
    final response = await http.get(
      url,
      headers: {
        authorization: bearer+requestToken!,
        contentType: jsonFormat,
        accept: jsonFormat
      }
    );

    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body);
      marach.log(jsonData.toString());
      final userData = UserDataModel.fromJson(json: jsonData);
      return userData;
    }
    else{
      marach.log(response.statusCode.toString());
      return null;
    }
  }
  catch (e){
    marach.log(e.toString());
    return null;
  }
}