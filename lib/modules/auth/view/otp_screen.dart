// ignore_for_file: unused_import

import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';
import 'package:deals_on_map/core/common_widgets/custom_otp_fileds.dart';
import 'package:deals_on_map/modules/auth/view/location_access_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatefulWidget {
  final String mobile;
  final String countryCode;

  const OtpScreen({super.key, required this.mobile, required this.countryCode});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'OTP Verification'),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Text(
                'We have sent a verification code to',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  fontFamily: regular,
                  color: textColor,
                ),
              ),
              Text(
                '+91-1234567890',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  fontFamily: regular,
                  color: const Color(0xFFEC554F),
                ),
              ),
              SizedBox(height: 30.h),
              const CustomOtpFileds(),
              SizedBox(height: 15.h),
              Text(
                'Check Text Messages For Your OTP',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  fontFamily: regular,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 30.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn’t get the OTP? ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: regular,
                        color: headingColor,
                      ),
                    ),
                    TextSpan(
                      text: ' Resend SMS in 30s',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: regular,
                        color: unselectedFontColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Column(
                children: [
                  CustomButton(
                      buttonName: "Continue",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationAccessScreen()));
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
