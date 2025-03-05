import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/core/common_widgets/fab_bottom_appbar_item.dart';
import 'package:deals_on_map/modules/dashboard/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  final int index;

  const Dashboard({super.key, required this.index});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late DashboardProvider provider;

  @override
  void initState() {
    provider = context.read<DashboardProvider>();
    provider.selectedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, state, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          body: IndexedStack(
            index: state.selectedIndex,
            children: state.pages,
          ),
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(),
            height: 80,
            child: Column(
              children: [
                FABBottomAppBar(
                  backgroundColor: Colors.white,
                  color: secondaryFontColor,
                  selectedColor: Colors.white,
                  iconSize: 24,
                  height: 50,
                  items: [
                    FABBottomAppBarItem(
                      selectedImage: homeFillIc,
                      unselectedImage: homeIc,
                      label: 'Home',
                    ),
                    FABBottomAppBarItem(
                      selectedImage: mapFillIc,
                      unselectedImage: mapIc,
                      label: 'MAP',
                    ),
                    FABBottomAppBarItem(
                      selectedImage: businessFillIc,
                      unselectedImage: businessIc,
                      label: 'Business',
                    ),
                    FABBottomAppBarItem(
                      selectedImage: offerFillIc,
                      unselectedImage: offerIc,
                      label: 'Offers',
                    ),
                    FABBottomAppBarItem(
                      selectedImage: profileFillIc,
                      unselectedImage: profileIc,
                      label: 'Profile',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
