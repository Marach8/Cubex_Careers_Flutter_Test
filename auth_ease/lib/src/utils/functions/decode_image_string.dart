import 'dart:convert';
import 'dart:typed_data';

Uint8List? decodeImageString({required String imageString}){
  try{
    final imageBytes = base64Decode(imageString);
    return imageBytes;
  }
  catch (_){
    return null;
  }
}