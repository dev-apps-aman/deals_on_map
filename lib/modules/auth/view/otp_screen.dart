// ignore_for_file: unused_import

import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';
import 'package:deals_on_map/core/common_widgets/custom_otp_fileds.dart';
import 'package:deals_on_map/modules/auth/provider/auth_provider.dart';
import 'package:deals_on_map/modules/auth/provider/timer_provider.dart';
import 'package:deals_on_map/modules/auth/view/location_access_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final Function(String) onOtpChanged;
  final VoidCallback onVerifyPressed;
  final VoidCallback onResendOtp;

  const OtpScreen({
    super.key,
    required this.phoneNumber,
    required this.onOtpChanged,
    required this.onVerifyPressed,
    required this.onResendOtp,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<TimerProvider>().startTimer());
  }

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
                widget.phoneNumber,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  fontFamily: regular,
                  color: const Color(0xFFEC554F),
                ),
              ),
              SizedBox(height: 30.h),
              CustomOtpFields(onOtpChanged: widget.onOtpChanged),
              SizedBox(height: 15.h),
              Consumer<TimerProvider>(
                builder: (context, timerProvider, child) {
                  return RichText(
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
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: timerProvider.isResendButtonEnabled
                                ? () => widget.onResendOtp()
                                : null,
                            child: Text(
                              timerProvider.isResendButtonEnabled
                                  ? ' Resend OTP'
                                  : ' Resend SMS in ${timerProvider.secondsRemaining}s',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                fontFamily: regular,
                                color: timerProvider.isResendButtonEnabled
                                    ? mainColor
                                    : unselectedFontColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 30.h),
              CustomButton(
                buttonName: "Continue",
                onPressed: widget.onVerifyPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
