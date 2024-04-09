import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context )
  => MediaQuery.of(context).size.width;

double getScreenHeight(BuildContext context) 
  => MediaQuery.of(context).size.height;

bool passwordIsStrong(String password){
  RegExp passwordRegex = RegExp(r'^(?=.*[!@#\$%^&*()_+\-=\[\]{};:\'"\\|,.<>/?0-9]).{8,}");
  // final regex = RegExp(r'^(?=.*[0-9])(?=.*[!@#\$%&\*])[a-zA-Z0-9!@#$%^&*]{8,}$');
  return passwordRegex.hasMatch(password);
}

String? validateForm({
  required String? value,
  bool? specialEmailCheck,
  bool? specialpasswordCheck
}){
  if(value == null || value.isEmpty){
    return emptyFieldsString;
  }

  else if(specialEmailCheck != null && !value.contains(atSignString)){
    return missingAtSignString;
  }

  else if(specialpasswordCheck != null && !passwordIsStrong(value)){
    return weakPasswordString;
  }
  else{
    return null;
  }
}