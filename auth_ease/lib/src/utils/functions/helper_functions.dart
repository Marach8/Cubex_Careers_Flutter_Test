import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context )
  => MediaQuery.of(context).size.width;

double getScreenHeight(BuildContext context) 
  => MediaQuery.of(context).size.height;

bool passwordIsStrong(String password){
  RegExp passwordRegex = RegExp(r'^(?=.*[!@#\$%^&*()_+\-=\[\]{};:\'"\\|,.<>/?0-9]).{8,}");
  return passwordRegex.hasMatch(password);
}

bool phoneNumberIsOkay(String phoneNumber){
  return phoneNumber.split(emptyString)
    .every((element) => numbers0to9.contains(element));
}

String? validateForm({
  required String? value,
  bool? specialEmailCheck,
  bool? specialpasswordCheck,
  bool? specialPhoneNumberCheck
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

  else if(specialPhoneNumberCheck != null && !phoneNumberIsOkay(value)){
    return invalidPhoneNumberString;
  }

  else{
    return null;
  }
}