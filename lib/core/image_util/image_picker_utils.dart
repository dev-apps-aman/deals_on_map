import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class PickImageUtility {
  PickImageUtility.instance({
    required this.applyEditor,
    required this.context,
    this.cropPageTitle,
    this.toolbarBackgroundColor,
    this.toolbarTextColor,
  });

  final bool applyEditor;

  final ImagePicker _picker = ImagePicker();
  final String? cropPageTitle;
  final Color? toolbarTextColor;
  final Color? toolbarBackgroundColor;
  final BuildContext context;

  Future<File?> pickedFile(ImageSource imageSource) async {
    final pickedImage = await _picker.pickImage(
      source: imageSource,
    );
    if (pickedImage != null) {
      if (applyEditor) {
        File(pickedImage.path);
      } else {
        return File(pickedImage.path);
      }
    }
    return null;
  }
}
