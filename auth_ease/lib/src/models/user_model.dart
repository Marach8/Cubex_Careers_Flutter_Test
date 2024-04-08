import 'dart:collection';
import 'package:auth_ease/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

@immutable 
class UserPayload extends MapView<String, String>{
  UserPayload({
    required String username,
    required String email,
    required String password, 
    required String userId
  }): super(
    {
        userNameString.toLowerCase(): username,
        emailString.toLowerCase(): email,
        passwordString.toLowerCase(): password,
        userIdString: userId,
        dateTimeOfSignUpString : DateFormat(dateFormatString).format(DateTime.now())
    }
  );
}