import 'package:deals_on_map/modules/business/views/business_offers/shop_offers_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar2.dart';
import 'package:deals_on_map/core/common_widgets/custom_btn.dart';
import 'package:deals_on_map/modules/business/provider/business_dashboard_provider.dart';

import 'package:deals_on_map/modules/business/views/business_details/view/business_details.dart';
import 'package:deals_on_map/modules/business/views/business_offers/create_shop_offer.dart';

import 'package:deals_on_map/modules/business/views/customize_profile/view/add_contact.dart';
import 'package:deals_on_map/modules/business/views/customize_profile/view/add_photos.dart';
import 'package:deals_on_map/modules/business/views/customize_profile/view/add_services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BusinessDashboard extends StatefulWidget {
  const BusinessDashboard({super.key});

  @override
  State<BusinessDashboard> createState() => BusinessDashboardState();
}

class BusinessDashboardState extends State<BusinessDashboard> {
  late final BusinessDashboardProvider businessDashboardProvider;
  @override
  void initState() {
    super.initState();
    businessDashboardProvider = context.read<BusinessDashboardProvider>();
    businessDashboardProvider.sellerDashboard(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar2(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'My Business ',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: medium,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Dashboard',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: medium,
                        fontWeight: FontWeight.w600,
                        color: headingColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BusinessDetails(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(35),
                        offset: const Offset(0, 0),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        businessDashboardProvider.sellerDetails?.businessName ??
                            '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w500,
                          color: headingColor,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                        decoration: BoxDecoration(
                          color: appBarBdrColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          businessDashboardProvider
                                  .sellerDetails?.categoryName ??
                              '',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            color: focusedBrdColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Address: ',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w600,
                                      color: headingColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: businessDashboardProvider
                                            .sellerDetails?.address ??
                                        '',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500,
                                      color: headingColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Icon(
                            Icons.mode_edit_outline_outlined,
                            size: 20.sp,
                            color: secondaryColor,
                          )
                        ],
                      ),
                      SizedBox(height: 26.h),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AddServices(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: mainColor,
                                    ),
                                    child: Text(
                                      '12',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: regular,
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 7.h),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Add\nServices',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500,
                                      color: mainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AddContact(),
                                    ));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: appBarBdrColor,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 20.sp,
                                      color: mainColor,
                                    ),
                                  ),
                                  SizedBox(height: 7.h),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Add\nContact',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500,
                                      color: mainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AddPhotos(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: appBarBdrColor,
                                    ),
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      size: 20.sp,
                                      color: mainColor,
                                    ),
                                  ),
                                  SizedBox(height: 7.h),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Add\nPhotos',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500,
                                      color: mainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: appBarBdrColor,
                                      ),
                                      child: Icon(
                                        Icons.video_call_outlined,
                                        size: 20.sp,
                                        color: mainColor,
                                      )),
                                  SizedBox(height: 7.h),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Add\nVideos',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500,
                                      color: mainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: appBarBdrColor,
                                    ),
                                    child: Image.asset(
                                      addReelsIc,
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                  ),
                                  SizedBox(height: 7.h),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Add\nReels',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500,
                                      color: mainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [white, lightPink],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border.all(color: brdColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Your Offers',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: regular,
                            fontWeight: FontWeight.w500,
                            color: headingColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ShopOffersListScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Text(
                                  'View All',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w700,
                                    color: mainColor,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Icon(Icons.arrow_forward_ios_outlined,
                                    size: 12.sp, color: mainColor),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 14.h),
                    CustomBtn(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Create Shop Offers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: regular,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Image.asset(
                              height: 23,
                              width: 23,
                              sendWhiteIc,
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateShopOffer(),
                            ),
                          );
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
