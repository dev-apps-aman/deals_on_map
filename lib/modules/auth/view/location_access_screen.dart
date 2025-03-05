// ignore_for_file: unused_import

import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';
import 'package:deals_on_map/core/common_widgets/custom_otp_fileds.dart';
import 'package:deals_on_map/modules/auth/provider/auth_provider.dart';
import 'package:deals_on_map/modules/auth/view/manually_location_screen.dart';
import 'package:deals_on_map/modules/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(locationImg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Your City, Your Vibe –\nLet’s Discover Your Perfect Fit!',
                  style: TextStyle(
                    fontFamily: regular,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  '"Elevate Your Savings with Exclusive Local Offers!"',
                  style: TextStyle(
                    fontFamily: regular,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: secondaryColor,
                  ),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  child: CustomButton(
                      buttonName: "Use Current Location",
                      onPressed: () async {
                        if (provider.locationPermissionGranted == true) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const Dashboard(index: 0)),
                            (route) => false,
                          );
                        } else {
                          await provider.requestLocationPermission(context);
                        }
                      }),
                ),
                SizedBox(height: 40.h),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ManuallyLocationScreen()));
                  },
                  child: Text(
                    textAlign: TextAlign.start,
                    'Select location\nManually',
                    style: TextStyle(
                      fontFamily: regular,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: secondaryFontColor,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      );
    });
  }
}
