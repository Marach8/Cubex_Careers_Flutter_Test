import 'dart:convert';
import 'package:flutter/material.dart';

dynamic displayUserProfilePhoto({required String imageString}){
  try{
    final imageBytes = base64Decode(imageString);
    return Image.memory(
      imageBytes,
    );
  }
  catch (_){
    return null;
  }
}