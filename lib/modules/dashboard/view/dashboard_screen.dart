import 'dart:io';
import 'package:deals_on_map/core/common_widgets/custom_app_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/core/common_widgets/fab_bottom_appbar_item.dart';
import 'package:deals_on_map/modules/dashboard/provider/dashboard_provider.dart';

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
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, child) {
        return SafeArea(
          child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (dashboardProvider.selectedIndex == 0) {
                bool exitConfirmed = await showExitConfirmationDialog(context);
                if (exitConfirmed) {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    if (!context.mounted) return;
                    Navigator.of(context).pop(true);
                  }
                }
              } else {
                dashboardProvider.onItemTapped(0);
              }
            },
            child: Scaffold(
              appBar: CustomAppBar2(),
              resizeToAvoidBottomInset: false,
              key: scaffoldKey,
              body: IndexedStack(
                index: dashboardProvider.selectedIndex,
                children: dashboardProvider.pages,
              ),
              bottomNavigationBar: SizedBox(
                width: MediaQuery.of(context).size.width,
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
          ),
        );
      },
    );
  }

  Future<bool> showExitConfirmationDialog(BuildContext context) async {
    try {
      bool? result = await showCupertinoDialog<bool>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text("Exit App"),
          content: const Text("Are you sure you want to exit?"),
          actions: [
            CupertinoDialogAction(
              child: const Text("Cancel"),
              onPressed: () {
                if (context.mounted) {
                  Navigator.of(context).pop(false);
                }
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text("Exit"),
              onPressed: () {
                if (context.mounted) {
                  Navigator.of(context).pop(true);
                }
              },
            ),
          ],
        ),
      );
      return result ?? false;
    } catch (e) {
      if (kDebugMode) {
        debugPrint("Error in exit dialog: $e");
      }
      return false;
    }
  }
}
