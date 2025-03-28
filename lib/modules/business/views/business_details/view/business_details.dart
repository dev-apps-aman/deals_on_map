import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/modules/business/views/business_details/view/pictures/view/pictures.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/pictures/view/pictures.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/reels/view/reels.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/account/view/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  BusinessDetailsState createState() => BusinessDetailsState();
}

class BusinessDetailsState extends State<BusinessDetails> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    Pictures(),
    Reels(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Aamod Itsolution",
          widget: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 20.sp,
            ),
          ),
        ),
        body: Column(
          children: [
            // Profile Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F9F1),
                border: Border(bottom: BorderSide(color: brdColor, width: 0.5)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          profileIcon,
                          height: 50.h,
                          width: 50.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aamod It Solution',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: regular,
                              color: headingColor,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'IT support and services',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: regular,
                                color: focusedBrdColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _statusWidget(verifyIc, "Verified", headingColor),
                      _statusWidget(offlineIc, "Offline", secondaryColor),
                      _statusWidget(onlineIc, "Online", secondaryColor),
                    ],
                  ),
                ],
              ),
            ),

            // Custom TabBar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: _tabItem(
                          selectedIndex == 0 ? pictureFillIc : pictureIc, 0)),
                  Expanded(
                      child: _tabItem(
                          selectedIndex == 1 ? reelFillIc : reelIc, 1)),
                  Expanded(
                    child: _tabItem(
                        selectedIndex == 2 ? accountFillIc : accountIc, 2),
                  ),
                ],
              ),
            ),

            // Selected Screen
            Expanded(child: screens[selectedIndex]),
          ],
        ),
      ),
    );
  }

  Widget _statusWidget(String icon, String text, Color color) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 20.h,
          width: 20.w,
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            fontFamily: regular,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _tabItem(String imagePath, int index) {
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: selectedIndex == index ? headingColor : brdColor,
                width: 2),
          ),
        ),
        child: Image.asset(
          imagePath,
          height: 24.sp,
          width: 24.sp,
        ),
      ),
    );
  }
}
