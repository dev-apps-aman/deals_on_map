import 'dart:convert';
import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/modules/dashboard/view/home/model/banner_model.dart';
import 'package:deals_on_map/modules/dashboard/view/home/model/category_model.dart';
import 'package:deals_on_map/modules/dashboard/view/home/model/seller_model.dart';
import 'package:deals_on_map/modules/dashboard/view/home/model/seller_offers_model.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:deals_on_map/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isExpanded = false;

  int currentIndex = 0;
  String currentLocation = 'Fetching location...';

  final CarouselController carouselController = CarouselController();

  List<BannerModel> bannerList = [];
  List<CategoryModel> categoryList = [];
  List<SellerCategoryModel> sellerCategoriesList = [];
  List<SellerOfferModel> sellerOfferList = [];

  void toggleCategoryView() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void updateCarouselIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  ///  **Step 1: Request Location Permission**
  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      getCurrentLocation();
    } else {
      updateLocation("Location permission denied");
    }
  }

  ///  **Step 2: Get Current Location**
  Future<void> getCurrentLocation() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        updateLocation("Location services are disabled");
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          updateLocation("Location permission permanently denied");
          return;
        }
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          updateLocation("Location permission denied");
          return;
        }
      }

      /// **Fetching User Location**
      LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      await getAddressFromCoordinates(position.latitude, position.longitude);
    } catch (e) {
      updateLocation("Failed to get location: ${e.toString()}");
    }
  }

  ///  **Step 3: Get Address from Coordinates**
  Future<void> getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        updateLocation(
            "${place.street}, ${place.name}, ${place.subLocality}, ${place.locality}, ${place.postalCode}");
      } else {
        updateLocation("Address not found");
      }
    } catch (e) {
      updateLocation("Failed to get address");
    }
  }

  ///  **Helper Function to Update Location**
  void updateLocation(String newLocation) {
    currentLocation = newLocation;
    notifyListeners();
  }

  ///  **API Call for Home Data**
  Future<void> homeApi(BuildContext context) async {
    try {
      Log.console(" [API CALL] Fetching Home Data...");
      setLoading(true);

      var response = await ApiService.homeListApi();
      Log.console(" [API RAW RESPONSE]: ${response.body}");

      var jsonResponse = jsonDecode(response.body);
      int statusCode = response.statusCode;
      bool isSuccess = statusCode == 200 && jsonResponse["status"] == true;

      if (!context.mounted) return;

      if (isSuccess) {
        Log.console(" [SUCCESS] Home Data Loaded Successfully");
        // successToast(
        //     context, jsonResponse["msg"] ?? "Data Loaded Successfully");

        bannerList = _parseList<BannerModel>(
            jsonResponse["banner"], BannerModel.fromJson);
        categoryList = _parseList<CategoryModel>(
            jsonResponse["categorie"], CategoryModel.fromJson);
        sellerCategoriesList = _parseList<SellerCategoryModel>(
            jsonResponse["seller_list"], SellerCategoryModel.fromJson);
        sellerOfferList = _parseList<SellerOfferModel>(
            jsonResponse["seller_offer_list"], SellerOfferModel.fromJson);

        notifyListeners();
      } else {
        _handleError(context, statusCode, jsonResponse);
      }
    } catch (e, stackTrace) {
      Log.console(" [EXCEPTION]: $e");
      Log.console(" [STACK TRACE]: $stackTrace");
      errorToast(context, "Something went wrong. Please try again.");
    } finally {
      setLoading(false);
    }
  }

  List<T> _parseList<T>(
      dynamic data, T Function(Map<String, dynamic>) fromJson) {
    return (data as List?)?.map((e) => fromJson(e)).toList() ?? [];
  }

  void _handleError(
      BuildContext context, int statusCode, Map<String, dynamic> jsonResponse) {
    Log.console(" [ERROR] Failed to Load Data: ${jsonResponse["msg"]}");
    Log.console(" [ERROR] Status Code: $statusCode");
    Log.console(" [ERROR] Response: $jsonResponse");

    errorToast(context, jsonResponse["msg"] ?? "Something went wrong");
  }

  ///  ** Manage Loading State**
  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
