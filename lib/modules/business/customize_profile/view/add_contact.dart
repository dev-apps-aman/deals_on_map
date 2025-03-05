import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
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
              const CustomProgressBar(totalPage: 3, currentPage: 2, isLoading: true),
              SizedBox(height: 26.h),
              Text(
                'Add Business Description & Contact',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: medium,
                  fontWeight: FontWeight.w500,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Let customers learn more about your business by adding a description to your Business Profile on Search, Maps, and other Deal on Map  services.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: regular,
                  fontWeight: FontWeight.w400,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 26.h),
              Container(
                width: double.infinity,
                height: 160.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: appBarBdrColor,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(10.dm),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: unselectedFontColor,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(10.dm),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Follow on Facebook',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w500,
                          color: unselectedFontColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      fbIc,
                      height: 25.h,
                      width: 25.w,
                      color: mainColor,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: unselectedFontColor,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(10.dm),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Follow on Instagram',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w500,
                          color: unselectedFontColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      instaIc,
                      height: 25.h,
                      width: 25.w,
                      color: mainColor,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: unselectedFontColor,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(10.dm),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Chat On Whatsapp',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w500,
                          color: unselectedFontColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      whatsappIc,
                      height: 25.h,
                      width: 25.w,
                      color: mainColor,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: unselectedFontColor,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(10.dm),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Subscribe on Youtube',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w500,
                          color: unselectedFontColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      ytIc,
                      height: 25.h,
                      width: 25.w,
                      color: mainColor,
                    )
                  ],
                ),
              ),
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
