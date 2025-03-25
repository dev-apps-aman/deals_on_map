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

class CreateBusinessAccount3 extends StatefulWidget {
  const CreateBusinessAccount3({super.key});

  @override
  State<CreateBusinessAccount3> createState() => _CreateBusinessAccount3State();
}

class _CreateBusinessAccount3State extends State<CreateBusinessAccount3> {
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
                'Add Your Online Store',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: medium,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Enter a web address where customers can purchase products.',
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
                    controller: businessAuthProvider.webLinkController,
                    borderRadius: 10,
                    fillColor: Colors.white,
                    borderCl: brdColor,
                    hintText: "Website Link",
                    leading1: Image.asset(
                      webIc,
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
                        .onWebLinkSubmit(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
