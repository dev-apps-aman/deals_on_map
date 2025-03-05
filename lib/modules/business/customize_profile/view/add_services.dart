import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddServices extends StatefulWidget {
  const AddServices({super.key});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Customize Profile"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomProgressBar(totalPage: 3, currentPage: 1, isLoading: true),
              SizedBox(height: 26.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(6.dm),
                ),
                child: Text(
                  'IT support and services',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: regular,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Add Your Services',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: medium,
                  fontWeight: FontWeight.w500,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Select the services your business provides and get matched with the right customers',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: regular,
                  fontWeight: FontWeight.w400,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 26.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: unselectedFontColor,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(4.dm),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 16.sp,
                      color: unselectedFontColor,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      'IT support and services',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: regular,
                        fontSize: 12.sp,
                        color: focusedBrdColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                buttonName: "Skip",
                onPressed: () {},
                textColor: mainColor,
                borderColor: mainColor,
                backgroundColor: Colors.white,
              )),
              SizedBox(width: 10.w),
              Expanded(child: CustomButton(buttonName: "Save Continue", onPressed: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
