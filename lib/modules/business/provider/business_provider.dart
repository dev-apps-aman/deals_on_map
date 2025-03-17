import 'dart:convert';

import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/core/common_widgets/loader_utils.dart';
import 'package:deals_on_map/modules/auth/provider/location_provider.dart';
import 'package:deals_on_map/modules/auth/provider/timer_provider.dart';
import 'package:deals_on_map/modules/auth/view/otp_screen.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account1.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account3.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account4.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account5.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account6.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account7.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:deals_on_map/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account2.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessProvider extends ChangeNotifier {
  // Text controller for business name
  TextEditingController businessNameController = TextEditingController();
  TextEditingController webLinkController = TextEditingController();
  TextEditingController bussCatController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController sAddressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool isLoading = true;

  //  Address Vari
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  String? fullAddress;

  String? selectedType;
  String otp = '';

  // // Checkbox states
  // bool isSelectedRetail = false;
  // bool isSelectedStore = false;
  // bool isSelectedService = false;

  // Address Lists
  List<String> countryList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  final List<Map<String, dynamic>> businessTypes = [
    {
      "title": "Online Retail",
      "description": "Customers can purchase products through your Website",
      "imagePath": retailIc
    },
    {
      "title": "Local Store",
      "description": "Customers can visit your business in person",
      "imagePath": shopIc
    },
    {
      "title": "Service Business",
      "description": "Your business makes visits to customers",
      "imagePath": serviceIc
    },
  ];

  // Bussiness mobile number submit
  Future<void> onSentOtp(BuildContext context) async {
    String mobile = mobileController.text.trim();

    if (mobile.isEmpty) {
      errorToast(context, "Enter Mobile Number");
      return;
    }
    if (mobile.length != 10) {
      errorToast(context, "Enter valid Mobile Number");
      return;
    }

    String mobileWithCode = '+91-$mobile';

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpScreen(
          phoneNumber: mobileWithCode,
          onOtpChanged: (otp) {
            updateOtp(otp);
          },
          onResendOtp: () {
            resendOtp(context);
          },
          onVerifyPressed: () {
            onOtpVerify(context);
          },
        ),
      ),
    );
  }

  void updateOtp(String newOtp) {
    otp = newOtp;
    notifyListeners();
  }

  void resendOtp(BuildContext context) {
    successToast(context, "Sending OTP...");

    // loginApi(context);

    context.read<TimerProvider>().resetTimer();
  }

// Bussiness otp verify
  Future<void> onOtpVerify(BuildContext context) async {
    String otpValue = otp.trim();
    if (otpValue.isEmpty) {
      errorToast(context, "Enter OTP");
      return;
    }
    if (otpValue.length != 6) {
      errorToast(context, "Enter a valid 6-digit OTP");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateBusinessAccount1()),
    );
  }

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
  void setSelectedBusinessType(String title) {
    if (selectedType == title) {
      selectedType = null;
    } else {
      selectedType = title;
    }
    notifyListeners();
  }

  Future<void> onBusinessTypeSubmit(BuildContext context) async {
    Log.console("Selected Business Type: $selectedType");

    if (selectedType == null || selectedType!.isEmpty) {
      errorToast(context, "Please select your business type");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateBusinessAccount3(),
      ),
    );
  }

  Future<void> onWebLinkSubmit(BuildContext context) async {
    String webLink = webLinkController.text.trim();

    if ((selectedType ?? "").toLowerCase() == "online retail" &&
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

  Future<void> onBussCatSubmit(BuildContext context) async {
    String bussCat = bussCatController.text.trim();
    String gst = gstController.text.trim();
    String pan = panController.text.trim();

    if (bussCat.isEmpty || gst.isEmpty || pan.isEmpty) {
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

// Fetching country list from the API
  Future<void> fetchCountryList(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await ApiService.countryList();
      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data is List) {
        countryList = List<String>.from(data);
      } else if (response.statusCode == 200 &&
          data is Map &&
          data.containsKey('countries')) {
        countryList = List<String>.from(data['countries']);
      } else {
        Log.console("Error: Unexpected API response format.");
        countryList = [];
        errorToast(context, "Failed to fetch countries.");
      }
    } catch (e) {
      Log.console("Error fetching country list: $e");
      countryList = [];
      errorToast(context, "Network issue. Please try again.");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Function to handle country change
  void onCountryChange(BuildContext context, String? country) async {
    if (country != null && country != selectedCountry) {
      selectedCountry = country;
      selectedState = null;
      selectedCity = null;
      stateList = [];
      cityList = [];

      notifyListeners();

      await fetchStateList(context, country);
    }
  }

// Fetching state list based on selected country
  Future<void> fetchStateList(BuildContext context, String country) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await ApiService.stateList(country);
      var data = jsonDecode(response.body);

      Log.console("State List Response: $data");

      if (response.statusCode == 200 && data is List) {
        stateList = List<String>.from(data);
      } else if (response.statusCode == 200 &&
          data is Map &&
          data.containsKey('states')) {
        stateList = List<String>.from(data['states']);
      } else {
        stateList = [];
        errorToast(context, "No states found for the selected country.");
      }
    } catch (e) {
      Log.console("Error fetching state list: $e");
      stateList = [];
      errorToast(context, "Failed to fetch states. Please try again.");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Function to handle state change
  void onStateChange(BuildContext context, String? state) async {
    if (state != null && state != selectedState) {
      selectedState = state;
      selectedCity = null;
      cityList = [];

      notifyListeners();

      await fetchCityList(context, state);
    }
  }

// Fetching city list based on selected state
  Future<void> fetchCityList(BuildContext context, String state) async {
    try {
      isLoading = true;
      notifyListeners();

      var response = await ApiService.cityList(state);
      var json = jsonDecode(response.body);

      Log.console("City List Response: $json");

      if (json != null && json.isNotEmpty) {
        cityList = json;
      } else {
        cityList = [];
        errorToast(context, "No cities found for the selected state.");
      }
    } catch (e) {
      print("Error fetching city list: $e");
      errorToast(context, "Failed to fetch cities. Please try again.");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Function to handle city change
  void onCityChange(String? city) {
    if (city != null && city != selectedCity) {
      selectedCity = city;
      notifyListeners();
    }
  }

  void setLocationFromLocationProvider(LocationProvider locationProvider) {
    fullAddress = locationProvider.fullAddress;
    selectedCountry = locationProvider.country;
    selectedState = locationProvider.state;
    selectedCity = locationProvider.city;
    sAddressController.text = locationProvider.street;
    pinCodeController.text = locationProvider.postalCode;

    Log.console("Full Address: $fullAddress");
    Log.console("selectedCountry: $selectedCountry");
    Log.console("selectedState: $selectedState");
    Log.console("selectedCity: $selectedCity");
    Log.console("Street Address: ${sAddressController.text}");
    Log.console("Pin Code: ${pinCodeController.text}");

    notifyListeners();
  }

  Future<void> fetchCurrentLoc(BuildContext context) async {
    try {
      LoaderUtils.showLoader(context);

      final locationProvider =
          Provider.of<LocationProvider>(context, listen: false);
      await locationProvider.getCurrentLocation();

      Log.console("Fetched Country: ${locationProvider.country}");
      Log.console("Fetched State: ${locationProvider.state}");
      Log.console("Fetched City: ${locationProvider.city}");

      // Fill the text fields
      sAddressController.text = locationProvider.street;
      pinCodeController.text = locationProvider.postalCode;
      fullAddress = locationProvider.fullAddress;

      // Make sure the country list contains your country
      if (!countryList.contains(locationProvider.country)) {
        countryList.add(locationProvider.country);
      }
      selectedCountry = locationProvider.country;

      // Make sure state list contains your state
      if (!stateList.contains(locationProvider.state)) {
        stateList.add(locationProvider.state);
      }
      selectedState = locationProvider.state;

      // Make sure city list contains your city
      if (!cityList.contains(locationProvider.city)) {
        cityList.add(locationProvider.city);
      }
      selectedCity = locationProvider.city;

      notifyListeners();

      Log.console("Updated lists to include location data");
      Log.console("Country list now has ${countryList.length} items");
      Log.console("State list now has ${stateList.length} items");
      Log.console("City list now has ${cityList.length} items");
    } catch (e) {
      print("Error fetching current location: $e");
    } finally {
      LoaderUtils.removeLoader(context);
    }
  }

// Bussiness address submit
  Future<void> onBussAddressSubmit(BuildContext context) async {
    // String bussCat = bussCatController.text.trim();
    String streetAddress = sAddressController.text.trim();
    String pinCode = pinCodeController.text.trim();

    if (streetAddress.isEmpty ||
        pinCode.isEmpty ||
        selectedCountry!.isEmpty ||
        selectedState!.isEmpty ||
        selectedCity!.isEmpty) {
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

  // Mobile Number skip
  Future<void> onSkip(BuildContext context) async {
    if (mobileController.text.trim().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateBusinessAccount7(),
        ),
      );
      return;
    }

    SharedPreferences sp = await SharedPreferences.getInstance();
    String? mobile = sp.getString('mobile');

    if (mobile != null && mobile.isNotEmpty) {
      mobileController.text = mobile;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateBusinessAccount7(),
        ),
      );
    } else {
      errorToast(context, "Mobile number is required. Please enter it.");
    }
  }

  // register seller
  Future<void> onSellerRegister(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      var response = await ApiService.sellerReg(
        businessCategoryId: '',
        businessName: businessNameController.text.trim(),
        businessType: '',
        businessOwnerName: '',
        sellerMobile: mobileController.text.trim(),
        websiteLink: webLinkController.text.trim(),
        gstNumber: gstController.text.trim(),
        panCardNumber: panController.text.trim(),
        address: sAddressController.text.trim(),
        countryId: '1',
        stateId: '1',
        cityId: '1',
        pincode: pinCodeController.text.trim(),
      );
      var json = jsonDecode(response.body);

      Log.console("State List Response: $json");

      if (json != null && json.isNotEmpty) {
        stateList = json;
      } else {
        stateList = [];
        errorToast(context, "No states found for the selected country.");
      }
    } catch (e) {
      print("Error fetching state list: $e");
      errorToast(context, "Failed to fetch states. Please try again.");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Payment  submit
  Future<void> onPaymentSubmit(BuildContext context) async {
    try {
      LoaderUtils.showLoader(context);
      notifyListeners();

      var response = await ApiService.countryList();
      var json = jsonDecode(response.body);

      Log.console("Country List Response: $json");

      if (json != null && json.isNotEmpty) {
        countryList = json;
      } else {
        countryList = [];
        errorToast(context, "No countries found.");
      }
    } catch (e) {
      print("Error fetching country list: $e");
      errorToast(context, "Failed to fetch countries. Please try again.");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
