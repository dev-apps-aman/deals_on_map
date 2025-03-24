import 'package:deals_on_map/modules/business/views/business_create_account/business_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/home_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/map/view/map_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/offers/view/offers.dart';
import 'package:deals_on_map/modules/dashboard/view/profile/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../business/views/business_dashboard/view/business_dashboard.dart';

class DashboardProvider extends ChangeNotifier {
  int selectedIndex = 0;
  bool isSeller = false;


  void updateSellerStatus(bool status) {
    isSeller = status;
    notifyListeners();
  }

  List<Widget> get pages {
    return [
      const HomeScreen(),
      const MapScreen(),
      isSeller ? const BusinessDashboard() : const BusinessScreen(),
      const Offers(),
      const ProfileScreen(),
    ];
  }


  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
