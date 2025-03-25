import 'dart:convert';
import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:deals_on_map/service/api_service.dart';
import 'package:flutter/material.dart';

class BusinessDashboard extends ChangeNotifier {
  // seller dashboard
  Future<void> sellerDashboard(BuildContext context) async {
    try {
      var result = await ApiService.sellerDashboard();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        if (context.mounted) {}
      } else {
        if (context.mounted) {
          errorToast(
              context, json["message"]?.toString() ?? "Something went wrong");
        }
      }
    } catch (e) {
      Log.console(e.toString());
    }
    notifyListeners();
  }

  // seller bussiness upload
  Future<void> sellerBusinessUpload(BuildContext context) async {
    try {
      var result = await ApiService.sellerBusinessUpload();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
      } else {
        if (context.mounted) {
          errorToast(
              context, json["message"]?.toString() ?? "Something went wrong");
        }
      }
    } catch (e) {
      Log.console(e.toString());
    }
    notifyListeners();
  }
}
