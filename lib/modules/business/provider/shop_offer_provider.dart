import 'dart:convert';
import 'dart:io';

import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/modules/business/models/business_shop_offer_list.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:deals_on_map/service/api_service.dart';
import 'package:flutter/material.dart';

import '../../../core/common_widgets/loader_utils.dart';

class ShopOfferProvider extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  List<File> selectedImages = [];
  List<ShopOfferModel> offerList = [];

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

  Future<void> onCreateShopOffer(BuildContext context) async {
    List<String> errors = [];
    var imagePath = [];

    if (titleController.text.isEmpty) {
      errors.add("Title is required");
    }
    if (descController.text.isEmpty) {
      errors.add("Description is required");
    }
    if (selectedImages.isEmpty) {
      errors.add("At least one image is required");
    }

    if (errors.isNotEmpty) {
      errorToast(context, errors.join("\n"));
      return;
    }

    for (int i = 0; i < selectedImages.length; i++) {
      imagePath.add(selectedImages[i].path);
      Log.console(selectedImages[i].path);
    }

    try {
      LoaderUtils.showLoader(context);

      var response = await ApiService.createShopOffer(
        selectedImages,
        titleController.text,
        descController.text,
      );

      var jsonResponse = jsonDecode(response.body);
      Log.console(jsonResponse);

      if (response.statusCode == 200) {
        LoaderUtils.removeLoader(context);
        if (!context.mounted) return;
        successToast(context, "Shop offer created successfully");
        resetData();
        Navigator.pop(context);
      } else {
        LoaderUtils.removeLoader(context);
        if (!context.mounted) return;
        errorToast(context, jsonResponse["message"] ?? "Something went wrong");
      }
    } catch (e) {
      LoaderUtils.removeLoader(context);
      Log.console(e.toString());
      errorToast(context, "Error: ${e.toString()}");
    }
  }

  resetData() {
    selectedImages.clear();
    titleController.clear();
    descController.clear();
  }

  Future<void> shopOfferList(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      var response = await ApiService.shopOfferList();
      var jsonResponse = jsonDecode(response.body);
      Log.console(jsonResponse);

      if (response.statusCode == 200) {
        if (!context.mounted) return;
        if (jsonResponse['status'] == true && jsonResponse['data'] != null) {
          isLoading = false;
          notifyListeners();
          offerList = jsonResponse['data']
              .map<ShopOfferModel>((item) => ShopOfferModel.fromJson(item))
              .toList();

          successToast(context, "Shop offers fetched successfully");
          notifyListeners();
        }
      } else {
        isLoading = false;
        notifyListeners();
        if (!context.mounted) return;
        errorToast(context, jsonResponse["message"] ?? "Something went wrong");
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
      errorToast(context, "Error: ${e.toString()}");
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
