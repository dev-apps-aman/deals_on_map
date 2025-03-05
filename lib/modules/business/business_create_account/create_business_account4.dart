import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';
import 'package:deals_on_map/modules/business/business_create_account/create_business_account2.dart';
import 'package:deals_on_map/modules/business/business_create_account/create_business_account5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateBusinessAccount4 extends StatefulWidget {
  const CreateBusinessAccount4({super.key});

  @override
  State<CreateBusinessAccount4> createState() => _CreateBusinessAccount4State();
}

class _CreateBusinessAccount4State extends State<CreateBusinessAccount4> {
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
                'Enter A Business Category',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: medium,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Help customers discover your business by industry by adding a business category',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: regular,
                  color: secondaryFontColor,
                ),
              ),
              SizedBox(height: 22.h),
              CustomTextField(
                borderRadius: 10,
                fillColor: Colors.white,
                borderCl: brdColor,
                hintText: "Business Category",
                txKeyboardType: TextInputType.phone,
                maxLength: 10,
                leading1: Image.asset(
                  catIc,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              SizedBox(height: 30.h),
              CustomButton(
                  buttonName: "Continue",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateBusinessAccount5()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
