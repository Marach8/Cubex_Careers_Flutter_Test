import 'dart:convert';
import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as marach show log;

Future<List<String>?> pickProfilePhoto() async{
  final ImagePicker imagePicker = ImagePicker();
  try{
    final XFile? pickedPhoto = await imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedPhoto != null){
      final imageFileName = pickedPhoto.path.split(slashString).last;
      final imageBytes = await pickedPhoto.readAsBytes();
      final foo = imageBytes.toString();
      marach.log('String of ImageBytes: $foo');
      final imageString = base64Encode(imageBytes);
      return [imageFileName, imageString];
    }
    else{
      return null;
    }
  }
  catch (_){
    return null;
  }
}