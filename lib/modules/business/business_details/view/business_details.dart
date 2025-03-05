import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/account/view/account.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/details_of_services.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/pictures/view/pictures.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/reels/view/reels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  int selectedIndex = 0;

  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsOfServices()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 14.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F9F1),
                  border: Border(
                    bottom: BorderSide(
                      color: brdColor,
                      width: 0.1.w,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          profileIcon,
                          height: 50.h,
                          width: 50.w,
                        ),
                        SizedBox(width: 7.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aamod Itsolution',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: regular,
                                color: headingColor,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'IT support and services',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: regular,
                                color: focusedBrdColor,
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
                        Row(
                          children: [
                            Image.asset(
                              verifyIc,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Verified',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: regular,
                                color: headingColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 30.w),
                        Row(
                          children: [
                            Image.asset(
                              offlineIc,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Offline',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: regular,
                                color: secondaryColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 30.w),
                        Row(
                          children: [
                            Image.asset(
                              onlineIc,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Online',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: regular,
                                color: secondaryColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildTabItem(
                          context,
                          index: 0,
                          image: pictureIc,
                          unselectedImage: pictureFillIc,
                          isSelected: selectedIndex == 0,
                          onTap: () {
                            updateSelectedIndex(0);
                          },
                        ),
                      ),
                      Expanded(
                        child: _buildTabItem(
                          context,
                          index: 0,
                          image: reelIc,
                          unselectedImage: reelFillIc,
                          isSelected: selectedIndex == 1,
                          onTap: () {
                            updateSelectedIndex(1);
                          },
                        ),
                      ),
                      Expanded(
                        child: _buildTabItem(
                          context,
                          index: 0,
                          image: accountIc,
                          unselectedImage: accountFillIc,
                          isSelected: selectedIndex == 2,
                          onTap: () {
                            updateSelectedIndex(2);
                          },
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: getTabContent(selectedIndex)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTabContent(int index) {
    switch (index) {
      case 0:
        return const Pictures();
      case 1:
        return const Reels();
      case 2:
        return const Account();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTabItem(
      BuildContext context, {
        required int index,
        required String image,
        required String unselectedImage,
        required bool isSelected,
        required Function() onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 200,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isSelected ? mainColor : brdColor,
              width: 2,
            ),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.asset(
              isSelected ? unselectedImage : image,
              height: 24.h,
              width: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
