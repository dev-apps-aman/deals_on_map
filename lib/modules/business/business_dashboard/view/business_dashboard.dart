import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar2.dart';
import 'package:deals_on_map/modules/business/business_details/view/business_details.dart';
import 'package:deals_on_map/modules/business/customize_profile/view/add_contact.dart';
import 'package:deals_on_map/modules/business/customize_profile/view/add_photos.dart';
import 'package:deals_on_map/modules/business/customize_profile/view/add_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessDashboard extends StatefulWidget {
  const BusinessDashboard({super.key});

  @override
  State<BusinessDashboard> createState() => _BusinessDashboardState();
}

class _BusinessDashboardState extends State<BusinessDashboard> {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BusinessDetails()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
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
                        'Aamod ItSolutions',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w500,
                          color: headingColor,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        decoration: BoxDecoration(
                          color: appBarBdrColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'IT support and services',
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
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              'Address: aadarsh, jaipur, Rajasthan 302004',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: regular,
                                fontWeight: FontWeight.w500,
                                color: headingColor,
                              ),
                            ),
                          ),
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
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddServices()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddContact()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPhotos()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
