import 'dart:io';
import 'package:flutter/material.dart';

class ShopOfferProvider extends ChangeNotifier {
  List<File> selectedImages = [];

  void addImage(File image) {
    selectedImages.insert(0, image);
    notifyListeners();
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
    notifyListeners();
  }

  void clearAllImages() {
    selectedImages.clear();
    notifyListeners();
  }
}
