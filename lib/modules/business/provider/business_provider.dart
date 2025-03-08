import 'package:deals_on_map/modules/business/business_create_account/create_business_account3.dart';
import 'package:deals_on_map/modules/business/business_create_account/create_business_account4.dart';
import 'package:deals_on_map/modules/business/business_create_account/create_business_account5.dart';
import 'package:deals_on_map/modules/business/business_create_account/create_business_account6.dart';
import 'package:flutter/material.dart';
import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/modules/business/business_create_account/create_business_account2.dart';

class BusinessProvider extends ChangeNotifier {
  // Text controller for business name
  TextEditingController businessNameController = TextEditingController();
  TextEditingController webLinkController = TextEditingController();
  TextEditingController bussCatController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController sAddressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  // Checkbox states
  bool isSelectedRetail = false;
  bool isSelectedStore = false;
  bool isSelectedService = false;

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

  Future<void> onBussAddressSubmit(BuildContext context) async {
    // String bussCat = bussCatController.text.trim();
    String streetAddress = sAddressController.text.trim();
    String pinCode = pinCodeController.text.trim();

    if (streetAddress.isEmpty || pinCode.isEmpty) {
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
}
