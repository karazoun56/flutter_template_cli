import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageUtils {
  //create a singleton
  ImageUtils._privateConstructor();
  static final ImageUtils instance = ImageUtils._privateConstructor();

  //create a method to get the image file
  Future<File?> _getImageFile({ImageSource? source}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source ?? ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  //create a method to get the image file from camera
  Future<File?> getImageFileFromCamera() async {
    return _getImageFile(source: ImageSource.camera);
  }

  //create a method to get the image file from gallery
  Future<File?> getImageFileFromGallery() async {
    return _getImageFile(source: ImageSource.gallery);
  }
}
