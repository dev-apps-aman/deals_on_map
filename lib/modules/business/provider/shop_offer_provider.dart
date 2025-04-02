import 'dart:convert';
import 'dart:io';
import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/modules/business/models/business_shop_offer_list_model.dart';
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
  List<String> deletedOfferImagesList = [];
  List<OfferImageModel> existingImages = [];
  ShopOfferModel? shopOfferModel;

  /// ✅ **Add Image**
  void addImage(File image) {
    selectedImages.insert(0, image);
    notifyListeners();
  }

  /// ✅ **Remove Selected Image**
  void removeImage(int index, bool isEditMode, BuildContext context) {
    if (isEditMode && existingImages.isEmpty && selectedImages.length == 1) {
      errorToast(context, "At least one image is required");
      return;
    }
    selectedImages.removeAt(index);
    notifyListeners();
  }

  /// ✅ **Remove Existing Image with Check**
  void removeExistingImage(
      int index, int imageID, bool isEditMode, BuildContext context) {
    if (isEditMode && existingImages.length == 1 && selectedImages.isEmpty) {
      errorToast(context, "At least one image is required");
      return;
    }
    deletedOfferImagesList.add(imageID.toString());
    existingImages.removeWhere((image) => image.id == imageID);
    notifyListeners();
  }

  /// ✅ **Clear All Selected Images**
  void clearAllImages() {
    selectedImages.clear();
    notifyListeners();
  }

  /// ✅ **Create Shop Offer**
  Future<void> onCreateShopOffer(BuildContext context) async {
    List<String> errors = [];
    if (titleController.text.trim().isEmpty) errors.add("Title is required");
    if (descController.text.trim().isEmpty) {
      errors.add("Description is required");
    }
    if (selectedImages.isEmpty) errors.add("At least one image is required");

    if (errors.isNotEmpty) {
      errorToast(context, errors.join("\n"));
      return;
    }

    try {
      LoaderUtils.showLoader(context);
      var response = await ApiService.createShopOffer(
        selectedImages,
        titleController.text.trim(),
        descController.text.trim(),
      );

      var jsonResponse = jsonDecode(response.body);
      Log.console(jsonResponse);

      if (response.statusCode == 200) {
        if (!context.mounted) return;
        LoaderUtils.removeLoader(context);

        successToast(context, "Shop offer created successfully");
        resetData();
        Navigator.pop(context);
        await shopOfferList(context);
      } else {
        if (!context.mounted) return;
        LoaderUtils.removeLoader(context);
        errorToast(context, jsonResponse["message"] ?? "Something went wrong");
      }
    } catch (e) {
      if (!context.mounted) return;
      Log.console(e.toString());
      LoaderUtils.removeLoader(context);
      errorToast(context, "Error: ${e.toString()}");
    }
  }

  /// ✅ **Update Shop Offer**
  Future<void> onUpdateShopOffer(BuildContext context, int offerId) async {
    try {
      LoaderUtils.showLoader(context);

      var response = await ApiService.updateShopOffer(
        selectedImages,
        titleController.text.trim().isEmpty
            ? shopOfferModel!.title
            : titleController.text.trim(),
        descController.text.trim().isEmpty
            ? shopOfferModel!.description
            : descController.text.trim(),
        offerId.toString(),
        deletedOfferImagesList,
      );

      var jsonResponse = jsonDecode(response.body);
      Log.console(jsonResponse);
      if (!context.mounted) return;

      LoaderUtils.removeLoader(context);

      if (response.statusCode == 200) {
        if (!context.mounted) return;
        successToast(context, "Shop offer updated successfully");
        resetData();
        deletedOfferImagesList.clear();
        await shopOfferList(context);

        Navigator.pop(context);
        notifyListeners();
      } else {
        errorToast(
            context, jsonResponse["message"] ?? "Failed to update offer");
      }
    } catch (e) {
      if (!context.mounted) return;
      LoaderUtils.removeLoader(context);
      errorToast(context, "Error: ${e.toString()}");
    }
  }

  /// ✅ **Delete Shop Offer**
  Future<void> onDeleteShopOffer(BuildContext context, int offerId) async {
    try {
      if (!context.mounted) return;
      LoaderUtils.showLoader(context);
      var response = await ApiService.deleteShopOffer(offerId);
      LoaderUtils.removeLoader(context);
      if (response.statusCode == 200) {
        if (!context.mounted) return;
        successToast(context, "Offer deleted successfully");
        offerList.removeWhere((offer) => offer.id == offerId);
        notifyListeners();
      } else {
        if (!context.mounted) return;
        errorToast(context, "Failed to delete offer");
      }
    } catch (e) {
      if (!context.mounted) return;
      LoaderUtils.removeLoader(context);
      errorToast(context, "Error: ${e.toString()}");
    }
  }

  /// ✅ **Set Edit Offer Data**
  void setEditOffer(ShopOfferModel offer) {
    shopOfferModel = offer;
    titleController.text = shopOfferModel!.title;
    descController.text = shopOfferModel!.description;

    selectedImages.clear();
    existingImages.clear();
    deletedOfferImagesList.clear();

    existingImages.addAll(
        offer.images.map((e) => OfferImageModel(id: e.id, image: e.image)));

    notifyListeners();
  }

  /// ✅ **Reset Data**
  void resetData() {
    selectedImages.clear();
    titleController.clear();
    descController.clear();
    existingImages.clear();
    deletedOfferImagesList.clear();
    notifyListeners();
  }

  /// ✅ **Fetch Shop Offer List**
  Future<void> shopOfferList(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      var response = await ApiService.shopOfferList();
      var jsonResponse = jsonDecode(response.body);
      Log.console(jsonResponse);

      if (response.statusCode == 200 &&
          jsonResponse['status'] == true &&
          jsonResponse['data'] != null) {
        offerList = (jsonResponse['data'] as List)
            .map((item) => ShopOfferModel.fromJson(item))
            .toList();
      } else {
        offerList.clear();
      }
    } catch (e) {
      Log.console(e.toString());
      errorToast(context, "Error: ${e.toString()}");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

}
