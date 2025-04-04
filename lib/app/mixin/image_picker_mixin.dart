import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin ImagePickerMixin {

  Future<File?> pickImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Dosya nesnesini oluştur ve döndür
      final file = File(pickedFile.path);

      return file;
    }
    return null;
  }

  bool get mounted => true;
}
