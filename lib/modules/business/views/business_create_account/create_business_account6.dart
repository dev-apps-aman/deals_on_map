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

class CreateBusinessAccount6 extends StatefulWidget {
  const CreateBusinessAccount6({super.key});

  @override
  State<CreateBusinessAccount6> createState() => _CreateBusinessAccount6State();
}

class _CreateBusinessAccount6State extends State<CreateBusinessAccount6> {
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
                'Add Your Phone Number',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: medium,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Let customers get in touch by including your phone number on your Business Profile.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: regular,
                  color: secondaryFontColor,
                ),
              ),
              SizedBox(height: 22.h),
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: unselectedFontColor,
                          width: 1,
                        )),
                    child: Row(
                      children: [
                        Image.asset(
                          indianFlagIc,
                          height: 22.h,
                          width: 30.w,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          '+91',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            fontFamily: regular,
                            color: headingColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Consumer<BusinessAuthProvider>(
                    builder: (context, businessAuthProvider, child) {
                      return Expanded(
                        child: CustomTextField(
                          controller: businessAuthProvider.mobileController,
                          borderRadius: 10,
                          maxLength: 10,
                          fillColor: Colors.white,
                          borderCl: unselectedFontColor,
                          hintText: "Enter Mobile Number",
                          txKeyboardType: TextInputType.phone,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              CustomButton(
                  buttonName: "Continue",
                  onPressed: () {
                    context
                        .read<BusinessAuthProvider>()
                        .onMobileSubmit(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
