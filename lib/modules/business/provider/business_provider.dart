import 'dart:convert';

import 'package:deals_on_map/core/common_widgets/loader_utils.dart';
import 'package:deals_on_map/modules/auth/provider/location_provider.dart';
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

  bool isLoading = true;

  //  Address Vari
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  // Checkbox states
  bool isSelectedRetail = false;
  bool isSelectedStore = false;
  bool isSelectedService = false;

  // Address Lists
  List<String> countryList = [];
  List<String> stateList = [];
  List<String> cityList = [];

  // Method to handle business name submission
  Future<void> onBusinessNameSubmit(BuildContext context) async {
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

  // Method to toggle retail checkbox state
  void toggleRetail(bool value) {
    isSelectedRetail = value;
    if (value) {
      isSelectedStore = false;
      isSelectedService = false;
    }
    notifyListeners();
  }

  // Method to toggle store checkbox state
  void toggleStore(bool value) {
    isSelectedStore = value;
    if (value) {
      isSelectedRetail = false;
      isSelectedService = false;
    }
    notifyListeners();
  }

  // Method to toggle service checkbox state
  void toggleService(bool value) {
    isSelectedService = value;
    if (value) {
      isSelectedRetail = false;
      isSelectedStore = false;
    }
    notifyListeners();
  }

  bool validateBusinessTypeSelection() {
    return isSelectedRetail || isSelectedStore || isSelectedService;
  }

  Future<void> onBusinessTypeSubmit(BuildContext context) async {
    if (!validateBusinessTypeSelection()) {
      errorToast(context, "Please select Your business type");
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

    if (isSelectedRetail && webLink.isEmpty) {
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

      var response = await ApiService.stateList(country);
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
    selectedCountry = locationProvider.country;
    Log.console("selectedCountry: $selectedCountry");

    selectedState = locationProvider.state;
    Log.console("selectedState: $selectedState");
    selectedCity = locationProvider.city;
    Log.console("selectedCity: $selectedCity");
    sAddressController.text = locationProvider.streetName;
    Log.console("Street Address: ${sAddressController.text}");
    pinCodeController.text = locationProvider.postalCode;
    Log.console("pin Code: ${pinCodeController.text}");
    notifyListeners();
  }

// Fetching current location
  Future<void> fetchCurrentLoc(BuildContext context) async {
    try {
      LoaderUtils.showLoader(context);

      final locationProvider =
          Provider.of<LocationProvider>(context, listen: false);
      await locationProvider.getCurrentLocation();

      final businessProvider =
          Provider.of<BusinessProvider>(context, listen: false);
      businessProvider.setLocationFromLocationProvider(locationProvider);
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

  // Bussiness address submit
  Future<void> onMobileNumberSubmit(BuildContext context) async {
    String mobile = mobileController.text.trim();

    if (mobile.isEmpty) {
      errorToast(context, "Enter Mobile Number");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateBusinessAccount7(),
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
