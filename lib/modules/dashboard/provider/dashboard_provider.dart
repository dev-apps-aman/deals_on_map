import 'package:deals_on_map/modules/business/business_dashboard/view/business_dashboard.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/home_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/map/view/map_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/offers/view/offers.dart';
import 'package:deals_on_map/modules/dashboard/view/profile/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';

class DashboardProvider extends ChangeNotifier {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const MapScreen(),
    const BusinessDashboard(),
    const Offers(),
    const ProfileScreen(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
