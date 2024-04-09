import 'dart:collection';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

@immutable 
class UserPayload extends MapView<String, String>{
  UserPayload({
    required String username,
    required String email,
    required String password, 
    required String address,
    required String phoneNumber,
    required String profilePictureString
  }): super(
    {
      userNameString.toLowerCase(): username,
      emailString.toLowerCase(): email,
      passwordString.toLowerCase(): password,
      addressString.toLowerCase(): address,
      phoneNumberString.toLowerCase(): phoneNumber,
      profilePictureString.toLowerCase(): profilePictureString,
      dateTimeOfSignUpString : DateFormat(dateFormatString).format(DateTime.now())
    }
  );
}
