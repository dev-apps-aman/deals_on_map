// ignore_for_file: use_build_context_synchronously, unused_local_variable, deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/modules/auth/view/otp_screen.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:deals_on_map/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AuthProvider extends ChangeNotifier {
  bool locationPermissionGranted = false;
  File? image;
  String countryCode = "";
  TextEditingController mobileController = TextEditingController();

  void updateImage(File newImage) {
    image = newImage;
    notifyListeners();
  }

  void onCountryChange(String countryCode1) {
    countryCode = countryCode1;
    print(countryCode);
    notifyListeners();
  }

  Future loginApi(BuildContext context, String countryCode1) async {
    String result = countryCode1.replaceAll('+', '');
    try {
      var mobile = mobileController.text.trim();

      final response = await ApiService.login(mobile, result);
      var json = jsonDecode(response.body);
      if (json.status == true) {
        successToast(context, json['massage']);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            OtpScreen()));
      } else {
        errorToast(context, json['massage']);
      }
    } catch (e) {
      Log.console(e.toString());
    }
    notifyListeners();
  }

  Future otpVerify(
    BuildContext context,
    String name,
    String mobile,
    String otp,
    String countryCode1,
  ) async {
    EasyLoading.show(status: 'Loading.....');
    try {
      final response = await ApiService.otpVerification(mobile, otp, countryCode1);
      var json = jsonDecode(response.body);
      OtpModel otpModel = OtpModel.fromJson(json);
      if (otpModel.status == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', otpModel.accessToken.toString());
        await prefs.setString('mobile', otpModel.data!.mobile.toString());
        await prefs.setString('name', otpModel.data!.name.toString());
        await prefs.setString('id', otpModel.data!.id.toString());
        await prefs.setString('relation', otpModel.data!.relation.toString());
        await prefs.setString('userType', otpModel.data!.userType.toString());
        await prefs.setString('countryCode1', "+$countryCode1");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const IntroVideoView()), (route) => false,);
      } else {
        errorToast(context, json['massage']);
      }
    } catch (e) {
      Log.console(e.toString());
    }
    notifyListeners();
  }

  Future<void> requestLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showPermissionDialog(context, 'Location Services Disabled', 'Please enable location services to use this feature.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showPermissionDialog(context, 'Permission Denied', 'Location permission is required.');
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    locationPermissionGranted = true;
    notifyListeners();
  }

  void showPermissionDialog(BuildContext context, String title, String content) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
