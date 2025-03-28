import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/business_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/home_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/map/view/map_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/offers/view/offers.dart';
import 'package:deals_on_map/modules/dashboard/view/profile/view/profile_screen.dart';
import '../../business/views/business_create_account/pending_verify_screen.dart';
import '../../business/views/business_dashboard/view/business_dashboard.dart';
import 'package:deals_on_map/service/api_service.dart';
import 'dart:convert';

class DashboardProvider extends ChangeNotifier {
  int selectedIndex = 0;
  int isSellerVerified = 0;

  DashboardProvider() {
    loadSellerStatus();
  }

  Future<void> loadSellerStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSellerVerified = prefs.getInt('is_seller_verified') ?? 0;
    log(isSellerVerified);
    notifyListeners();
  }

  Future<void> fetchSellerVerificationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    if (token == null) {
      print(" No Token Found, Cannot Fetch Seller Status");
      return;
    }

    try {
      final result = await ApiService.sellerDashboard();
      var json = jsonDecode(result.body);
      print(" API Response: $json");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      isSellerVerified = 1;
      await prefs.setInt('is_seller_verified', 1);
      notifyListeners();

      print(" Seller Status Set to 1 (Pending)");
    } catch (e) {
      print(" Error Fetching Seller Status: $e");
    }
  }

  List<Widget> get pages {
    return [
      const HomeScreen(),
      const MapScreen(),
      // isSellerVerified== 0? BusinessScreen():  isSellerVerified== 1 ?PendingVerificationScreen(): BusinessDashboard() ,
      BusinessDashboard(),
      const Offers(),
      const ProfileScreen(),
    ];
  }


  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
