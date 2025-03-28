import 'dart:convert';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/modules/auth/provider/location_provider.dart';
import 'package:deals_on_map/modules/auth/view/otp_screen.dart';
import 'package:deals_on_map/modules/business/models/business_cat_model.dart';
import 'package:deals_on_map/modules/business/models/business_cat_services_model.dart';
import 'package:deals_on_map/modules/business/models/business_type_model.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account2.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account3.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account4.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account5.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account6.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:deals_on_map/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../views/business_pro/view/business_pro.dart';

class BusinessAuthProvider extends ChangeNotifier {
  // Text controller for business name
  TextEditingController businessNameController = TextEditingController();
  TextEditingController webLinkController = TextEditingController();
  TextEditingController bussCatController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController sAddressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool isLoading = true;
  String otp = '';
  String? fullAddress;
  String countryCode = '91';

  BusinessTypeModel? selectedBusinessType;
  BusinessCatModel? selectedBusinessCat;

  List<BusinessCatModel> businessCatList = [];
  List<BusinessCatServicesModel> businessCatServicesList = [];
  List<BusinessCatServicesModel> selectedBusinessCatServices = [];

  final List<BusinessTypeModel> businessTypesList = [
    BusinessTypeModel(
      title: "Online Retail",
      description: "Customers can purchase products through your Website",
      imagePath: retailIc,
      apiValue: "online_retail",
    ),
    BusinessTypeModel(
      title: "Local Store",
      description: "Customers can visit your business in person",
      imagePath: shopIc,
      apiValue: "local_store",
    ),
    BusinessTypeModel(
      title: "Service Business",
      description: "Your business makes visits to customers",
      imagePath: serviceIc,
      apiValue: "service_business",
    ),
  ];

  int selectedPlan = 0;
  // 0 -> Free, 1 -> ₹599, 2 -> ₹999
  final List<Map<String, dynamic>> plans = [
    {
      'title': 'Free',
      'price': 0,
    },
    {
      'title': 'Basic',
      'price': 599,
    },
    {
      'title': 'Pro',
      'price': 999,
    },
  ];

  void selectPlan(int index) {
    selectedPlan = index;
    notifyListeners();
  }

  void updateOtp(String newOtp) {
    otp = newOtp;
    notifyListeners();
  }

  // void resendOtp(BuildContext context) {
  //   successToast(context, "Sending OTP...");

  //   // loginApi(context);

  //   context.read<TimerProvider>().resetTimer();
  // }

  // Method to handle business name submission
  Future<void> onBusinessNameSubmit(BuildContext context) async {
    if (nameController.text.isEmpty) {
      errorToast(context, "Enter Your Full Name");
      return;
    }
    if (businessNameController.text.isEmpty) {
      errorToast(context, "Please enter business name");
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateBusinessAccount2(),
      ),
    );
  }

  // toggle business type
  void setSelectedBusinessType(BusinessTypeModel type) {
    if (selectedBusinessType == type) {
      Log.console("Business Type Deselected: ${type.title}");
      selectedBusinessType = null;
    } else {
      selectedBusinessType = type;
      Log.console("Business Type Selected: ${type.title}");
    }
    notifyListeners();
  }

  Future<void> onBusinessTypeSubmit(BuildContext context) async {
    Log.console("Submit Button Clicked");

    if (selectedBusinessType == null) {
      Log.console("Error: No business type selected!");
      errorToast(context, "Please select your business type");
      return;
    }

    Log.console(
        "Navigating to Next Screen with Type: ${selectedBusinessType!.title}");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateBusinessAccount3(),
      ),
    );
  }

  Future<void> onWebLinkSubmit(BuildContext context) async {
    String webLink = webLinkController.text.trim();

    if (selectedBusinessType?.title.toLowerCase() == "online retail" &&
        webLink.isEmpty) {
      errorToast(context, "Please enter your website link");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateBusinessAccount4(),
      ),
    );
  }

  // Fetch business categories
  Future<void> fetchBusinessCategories(BuildContext context) async {
    try {
      businessCatList.clear();
      selectedBusinessCat = null;
      final response = await ApiService.businessCategoryList();
      var json = jsonDecode(response.body);
      Log.console("Business Category API Response: $json");

      if (json != null && json is List) {
        businessCatList =
            json.map((e) => BusinessCatModel.fromJson(e)).toList();
        Log.console("Business Categories Loaded: ${businessCatList.length}");
      } else {}
    } catch (e) {
      Log.console(e.toString());
    }
    notifyListeners();
  }

  // Handle business category change.......
  void onBusinessCategoryChange(BuildContext context, BusinessCatModel model) {
    selectedBusinessCat = model;
    selectedBusinessCatServices.clear();
    notifyListeners();

    fetchCategoryServices(context, selectedBusinessCat!.id.toString());
  }


  Future<void> fetchCategoryServices(
      BuildContext context, String categoryId) async {
    try {
      businessCatServicesList.clear();
      selectedBusinessCatServices.clear();
      var result = await ApiService.businessCategoryServicesList(categoryId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        if (context.mounted) {
          businessCatServicesList = List<BusinessCatServicesModel>.from(
                  json['data'].map((i) => BusinessCatServicesModel.fromJson(i)))
              .toList(growable: true);
        }
      } else {
        if (context.mounted) {
          errorToast(context, json["message"].toString());
        }
      }
    } catch (e) {
      Log.console(e.toString());
    }
    notifyListeners();
  }

  void toggleSelection(BusinessCatServicesModel item) {
    if (selectedBusinessCatServices.contains(item)) {
      selectedBusinessCatServices.remove(item);
      Log.console(" Removed: ${item.title}");
    } else {
      selectedBusinessCatServices.add(item);
      Log.console(" Added: ${item.title}");
    }

    Log.console(
        " Updated Selected Items: ${selectedBusinessCatServices.map((e) => e.title).toList()}");

    selectedBusinessCatServices = List.from(selectedBusinessCatServices);
    notifyListeners();
  }

  Future<void> onBussCatSubmit(BuildContext context) async {
    String gst = gstController.text.trim();
    String pan = panController.text.trim();

    if (selectedBusinessCat == null ||
        selectedBusinessCatServices.isEmpty ||
        gst.isEmpty ||
        pan.isEmpty) {
      errorToast(context, "Please fill all details");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateBusinessAccount5(),
      ),
    );
  }

  Future<void> fetchCurrentLoc(BuildContext context) async {
    try {
      final locationProvider =
          Provider.of<LocationProvider>(context, listen: false);

      bool permissionGranted =
          await locationProvider.requestLocationPermission(context);

      Log.console(" Permission Result: $permissionGranted");
      if (!permissionGranted) {
        return;
      }

      await locationProvider.getCurrentLocation(context);
      Log.console(" getCurrentLocation() Executed Successfully");

      Log.console(" Fetched Country: ${locationProvider.country}");
      Log.console(" Fetched State: ${locationProvider.state}");
      Log.console(" Fetched City: ${locationProvider.city}");

      countryController.text = locationProvider.country;
      stateController.text = locationProvider.state;
      cityController.text = locationProvider.city;
      sAddressController.text = locationProvider.currentLocation;
      pinCodeController.text = locationProvider.postalCode;

      notifyListeners();
    } catch (e) {
      Log.console(" Error fetching current location: $e");
    }
  }

// Bussiness address submit
  Future<void> onBussAddressSubmit(BuildContext context) async {
    String country = countryController.text.trim();
    String state = stateController.text.trim();
    String city = cityController.text.trim();
    String street = sAddressController.text.trim();
    String pinCode = pinCodeController.text.trim();

    if (country.isEmpty ||
        state.isEmpty | city.isEmpty ||
        street.isEmpty ||
        pinCode.isEmpty) {
      errorToast(context, "Please fill all details");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateBusinessAccount6(),
      ),
    );
  }

  // Mobile Number submit
  Future<void> onMobileSubmit(BuildContext context) async {
    try {
      final enteredMobile = mobileController.text.trim();

      if (enteredMobile.isEmpty) {
        errorToast(context, "Mobile number is required. Please enter it.");
        return;
      }
      if (enteredMobile.length != 10) {
        errorToast(context, "Enter A Valid Mobile Number");
        return;
      }

      // SharedPreferences sp = await SharedPreferences.getInstance();
      // String? token = sp.getString('access_token');

      // String isAlreadyVerify = (token != null && token.isNotEmpty) ? "1" : "0";
      String isAlreadyVerify = "1";
      onSellerRegisterOtp(context, isAlreadyVerify);
    } catch (e, stackTrace) {
      Log.console(" Error in onMobileSubmit: $e");
      Log.console("Stack Trace: $stackTrace");
      errorToast(
          context, "Something went wrong while submitting your mobile number.");
    }
  }

//
  Future<void> onSellerRegisterOtp(
      BuildContext context, String isAlreadyVerify) async {
    try {
      isLoading = true;
      notifyListeners();
      List<String> selectedServiceIds =
          selectedBusinessCatServices.map((e) => e.id.toString()).toList();
      var response = await ApiService.sellerRegOtp(
        selectedServiceIds,
        businessName: businessNameController.text.trim(),
        businessOwnerName: nameController.text.trim(),
        businessType: selectedBusinessType!.apiValue,
        websiteLink: webLinkController.text.trim(),
        businessCategoryId: selectedBusinessCat!.id.toString(),
        gstNumber: gstController.text.trim(),
        panCardNumber: panController.text.trim(),
        countryId: countryController.text.trim(),
        stateId: stateController.text.trim(),
        cityId: cityController.text.trim(),
        address: sAddressController.text.trim(),
        pincode: pinCodeController.text.trim(),
        sellerMobile: mobileController.text.trim(),
        countryCode: countryCode.trim(),
        isAlreadyVerify: isAlreadyVerify,
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Log.console(" OTP Sent API Response: $json");

        if (json['status'] == true) {
          successToast(context, json['msg'] ?? "OTP Sent Successfully!");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                phoneNumber: mobileController.text,
                onOtpChanged: (otp) {
                  Log.console("User Entered OTP: $otp");
                  updateOtp(otp);
                },
                onResendOtp: () {
                  onSellerRegisterOtp(context, isAlreadyVerify);
                },
                onVerifyPressed: () {
                  onSellerRegisterVerify(context,
                      otp: otp, isAlreadyVerify: isAlreadyVerify);
                },
              ),
            ),
          );
        } else {
          errorToast(
              context, json['msg'] ?? "Failed to send OTP. Please try again.");
        }
      } else {
        Log.console(" Server Error: ${response.statusCode}");
        errorToast(context, "Server Error: ${response.statusCode}");
      }
    } catch (e, stackTrace) {
      Log.console(" Error in onSellerRegisterOtp: $e");
      Log.console("Stack Trace: $stackTrace");
      errorToast(context, "Failed to send OTP. Please try again.");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

//
  Future<void> onSellerRegisterVerify(BuildContext context,
      {required String otp, required String isAlreadyVerify}) async {
    try {
      isLoading = true;
      notifyListeners();

      String otpValue = otp.trim();
      if (otpValue.isEmpty) {
        errorToast(context, "Enter OTP");
        return;
      }
      if (otpValue.length != 6) {
        errorToast(context, "Enter a valid 6-digit OTP");
        return;
      }

      List<String> selectedServiceIds =
          selectedBusinessCatServices.map((e) => e.id.toString()).toList();

      Log.console(
          "🔹 Final OTP Sent for Verification: $otp | Type: ${otp.runtimeType}");

      var response = await ApiService.sellerRegVerify(
        selectedServiceIds,
        businessName: businessNameController.text.trim(),
        businessOwnerName: nameController.text.trim(),
        businessType: selectedBusinessType!.apiValue,
        websiteLink: webLinkController.text.trim(),
        businessCategoryId: selectedBusinessCat!.id.toString(),
        gstNumber: gstController.text.trim(),
        panCardNumber: panController.text.trim(),
        countryId: countryController.text.trim(),
        stateId: stateController.text.trim(),
        cityId: cityController.text.trim(),
        address: sAddressController.text.trim(),
        pincode: pinCodeController.text.trim(),
        sellerMobile: mobileController.text.trim(),
        countryCode: countryCode.trim(),
        isAlreadyVerify: isAlreadyVerify,
        otp: otp,
      );

      var json = jsonDecode(response.body);
      Log.console(" OTP Verification API Response: $json");

      if (json["status"] == true) {
        successToast(context, json["msg"] ?? "OTP verified successfully!");

        if (json["user"] != null) {
          String sellerID = json["user"]["id"].toString();

          var prefs = await SharedPreferences.getInstance();
          await prefs.setString("sellerID", sellerID);
          await prefs.setInt('is_seller_verified', 1);

          Log.console(" Seller ID Saved: $sellerID");
        }
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BusinessPro()),
          (Route<dynamic> route) => false,
        );
      } else {
        errorToast(context,
            json["msg"] ?? "OTP verification failed. Please try again.");
      }
    } catch (e, stackTrace) {
      Log.console(" Error in onSellerRegisterVerify: $e");
      Log.console("Stack Trace: $stackTrace");
      errorToast(context, "Failed to verify OTP. Please try again.");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

// Payment  submit
  Future<void> onPaymentSubmit(BuildContext context) async {
    try {
      successToast(context, "Payment Successfully Done!");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Dashboard(index: 2)),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print("Error during payment submit: $e");
      errorToast(context, "Failed to complete payment. Please try again.");
    }
  }
}
