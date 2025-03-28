// ignore_for_file: use_build_context_synchronously, unused_local_variable, deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'package:deals_on_map/core/common_widgets/loader_utils.dart';
import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/modules/auth/provider/timer_provider.dart';
import 'package:deals_on_map/modules/auth/view/location_access_screen.dart';
import 'package:deals_on_map/modules/auth/view/otp_screen.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:deals_on_map/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool locationPermissionGranted = false;
  File? image;
  String countryCode = '+91';
  String otp = '';
  TextEditingController mobileController = TextEditingController();

  void onCountryChange(String countryCode1) {
    countryCode = countryCode1;
    Log.console(countryCode);
    notifyListeners();
  }

  Future<void> loginApi(BuildContext context) async {
    try {
      String mobile = mobileController.text.trim();
      String code = countryCode.replaceAll('+', '');

      if (mobile.isEmpty) {
        errorToast(context, 'Enter Mobile Number');
        return;
      }

      final response = await ApiService.login(mobile, code);
      var json = jsonDecode(response.body);

      Log.console("Login API Response: $json");

      if (json.containsKey('message') &&
          json['message'] == "OTP sent successfully") {
        successToast(context, json['message']);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              phoneNumber: "$countryCode-$mobile",
              onOtpChanged: (otp) {
                updateOtp(otp);
              },
              onVerifyPressed: () {
                otpVerify(context);
              },
              onResendOtp: () {
                resendOtp(context);
              },
            ),
          ),
        );
      } else {
        errorToast(
            context,
            json.containsKey('message')
                ? json['message']
                : "Something went wrong");
      }
    } catch (e) {
      Log.console("Login API Error: $e");
      errorToast(context, "An error occurred. Please try again.");
    }
  }

  void updateOtp(String newOtp) {
    otp = newOtp;
    notifyListeners();
  }

  void resendOtp(BuildContext context) {
    successToast(context, "Sending OTP...");

    loginApi(context);

    context.read<TimerProvider>().resetTimer();
  }

  Future otpVerify(
    BuildContext context,
  ) async {
    try {
      String code = countryCode.replaceAll('+', '');

      final response = await ApiService.otpVerification(
          mobileController.text.trim(), otp, code);
      var json = jsonDecode(response.body);

      if (json['message'] == "OTP verified successfully") {


        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', json['access_token'] ?? '');
        await prefs.setString('mobile', json['user']?['mobile'] ?? '');
        await prefs.setString('name', json['user']?['name'] ?? '');
        await prefs.setString('id', json['user']?['id']?.toString() ?? '');
        await prefs.setString('status', json['user']?['status'] ?? '');
        await prefs.setString('role', json['user']?['role'] ?? '');
        await prefs.setString('countryCode', countryCode);
        await prefs.setString('countryCode', countryCode);
        await prefs.setInt('is_seller_verified', json['user']?['is_seller_verified']);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LocationAccessScreen()),
          (route) => false,
        );
      } else {
        errorToast(context, json['message'] ?? "Invalid OTP");
      }
    } catch (e) {
      Log.console("Error in OTP Verification: $e");
      errorToast(context, "An error occurred. Please try again.");
    }
    notifyListeners();
  }

  Future<void> requestLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      LoaderUtils.showLoader(context);

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        LoaderUtils.removeLoader(context);
        showPermissionDialog(context, 'Location Services Disabled',
            'Please enable location services to use this feature.');
        return;
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          LoaderUtils.removeLoader(context);
          showPermissionDialog(
              context, 'Permission Denied', 'Location permission is required.');
          return;
        }
      } else if (permission == LocationPermission.deniedForever) {
        LoaderUtils.removeLoader(context);
        showPermissionDialog(context, 'Permission Denied Forever',
            'Location permission is permanently denied. Please go to settings to enable it.');
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      locationPermissionGranted = true;
      LoaderUtils.removeLoader(context);
      notifyListeners();
    } catch (e) {
      LoaderUtils.removeLoader(context);
      Log.console("Error in location permission: $e");
      errorToast(context, "Failed to get location permission.");
    }
  }

  void showPermissionDialog(
      BuildContext context, String title, String content) {
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

  void updateImage(File newImage) {
    image = newImage;
    notifyListeners();
  }
}
