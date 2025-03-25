import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';
import 'package:deals_on_map/modules/business/provider/business_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateBusinessAccount1 extends StatelessWidget {
  const CreateBusinessAccount1({super.key});

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
                'Get your business discovered on Deal on Map Search, Maps and more',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: medium,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Enter a few business details to get started',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: regular,
                  color: secondaryFontColor,
                ),
              ),
              SizedBox(height: 22.h),
              Consumer<BusinessAuthProvider>(
                builder: (context, businessAuthProvider, child) {
                  return CustomTextField(
                    controller: businessAuthProvider.nameController,
                    borderRadius: 10,
                    fillColor: Colors.white,
                    borderCl: brdColor,
                    hintText: "Enter Full Name",
                    leading1: Image.asset(
                      profileFillIc,
                      height: 20.h,
                      width: 20.w,
                    ),
                  );
                },
              ),
              SizedBox(height: 22.h),
              Consumer<BusinessAuthProvider>(
                builder: (context, businessAuthProvider, child) {
                  return CustomTextField(
                    controller: businessAuthProvider.businessNameController,
                    borderRadius: 10,
                    fillColor: Colors.white,
                    borderCl: brdColor,
                    hintText: "Business Name",
                    txKeyboardType: TextInputType.text,
                    leading1: Image.asset(
                      shopIc,
                      height: 20.h,
                      width: 20.w,
                    ),
                  );
                },
              ),
              SizedBox(height: 30.h),
              CustomButton(
                buttonName: "Continue",
                onPressed: () {
                  context
                      .read<BusinessAuthProvider>()
                      .onBusinessNameSubmit(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
