import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManuallyLocationScreen extends StatefulWidget {
  const ManuallyLocationScreen({super.key});

  @override
  State<ManuallyLocationScreen> createState() => _ManuallyLocationScreenState();
}

class _ManuallyLocationScreenState extends State<ManuallyLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(title: "Location"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
          child: Column(
            children: [
              CustomSearchBar(
                hintText: "Search New",
                borderRadius: BorderRadius.circular(10.dm),
                leading2: Icon(
                  Icons.search_rounded,
                  size: 20.sp,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    currentLocIc,
                    height: 16.h,
                    width: 16.w,
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Location',
                        style: TextStyle(
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xFFD11100),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Using GPS',
                        style: TextStyle(
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: const Color(0xFF9B9B9B),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.h),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        locationOnIc,
                        height: 16.h,
                        width: 16.w,
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adarsh Nagar',
                            style: TextStyle(
                              fontFamily: medium,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: headingColor,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '4th Floor, Plot No, H-458, 401, Azad Marg, .....',
                            style: TextStyle(
                              fontFamily: regular,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: const Color(0xFF9B9B9B),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            height: 1.h,
                            width: MediaQuery.of(context).size.width - 70,
                            decoration: const BoxDecoration(color: dividerColor),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
