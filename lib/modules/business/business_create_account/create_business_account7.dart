import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/modules/business/business_pro/view/business_pro.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateBusinessAccount7 extends StatefulWidget {
  const CreateBusinessAccount7({super.key});

  @override
  State<CreateBusinessAccount7> createState() => _CreateBusinessAccount7State();
}

class _CreateBusinessAccount7State extends State<CreateBusinessAccount7> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Create Account"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.start,
                'Put Your Business On The Map',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: medium,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Start connecting with your customers',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: regular,
                  color: secondaryFontColor,
                ),
              ),
              SizedBox(height: 22.h),
              Text(
                'What Offers',
                style: TextStyle(
                  fontFamily: medium,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12.h),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 3, bottom: 3, left: 3, right: 3),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: mainColor,
                        ),
                        child: Icon(
                          Icons.check_outlined,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Enhance your business visibility',
                        style: TextStyle(
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: secondaryFontColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 30.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 14.sp,
                  ),
                  children: [
                    TextSpan(
                      text: 'By continuing, you are agreeing to these ',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'terms of service ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: mainColor,
                        fontSize: 10.sp,
                        fontFamily: regular,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Log.console('Terms of Service clicked');
                        },
                    ),
                    TextSpan(
                      text: 'and ',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'privacy policy',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 10.sp,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Privacy Policy clicked');
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              CustomButton(
                  buttonName: "Continue",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BusinessPro()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
