

import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/modules/auth/provider/auth_provider.dart';
import 'package:deals_on_map/modules/business/provider/business_provider.dart';
import 'package:deals_on_map/modules/business/views/business_dashboard/view/business_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class BusinessPro extends StatelessWidget {
  const BusinessPro({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer< BusinessProvider>(
      builder: (context,  businessProvider, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(businessBackImg),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          proCheckIc,
                          width: 117.w,
                          height: 130.h,
                        ),
                        SizedBox(height: 14.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF1BAA41).withAlpha(180),
                                  offset: const Offset(0, 0),
                                  blurRadius: 15,
                                  spreadRadius: 15,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              updateToProImg,
                              height: 45.h,
                              width: 214.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Plans Heading
                        Text(
                          'Select Your Plan',
                          style: TextStyle(
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        // Plan Cards Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              businessProvider.plans.length, (index) {
                            final plan = businessProvider.plans[index];
                            bool isSelected = businessProvider.selectedPlan == index;
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  businessProvider.selectPlan(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.h, horizontal: 8.w),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? mainColor.withOpacity(0.1)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: isSelected
                                          ? mainColor
                                          : appBarBdrColor,
                                      width: 1.w,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        plan['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: semiBold,
                                          fontSize: 18.sp,
                                          color: headingColor,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        plan['price'] == 0
                                            ? 'Free'
                                            : '₹ ${plan['price']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: regular,
                                          fontSize: 14.sp,
                                          color: secondaryFontColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 30.h),
                        // Plan Details Section
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 16.h),
                          decoration: BoxDecoration(
                            color: appBarBdrColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: appBarBdrColor,
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      businessProvider.selectedPlan == 0
                                          ? 'Free Plan'
                                          : 'Premium Plan',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: semiBold,
                                        fontSize: 22.sp,
                                        color: headingColor,
                                      ),
                                    ),
                                    SizedBox(height: 3.h),
                                    Text(
                                      businessProvider.selectedPlan == 0
                                          ? 'Enjoy basic features at no cost.'
                                          : 'Access enhanced features for your business.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: regular,
                                        fontSize: 14.sp,
                                        color: focusedBrdColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.w),
                              if (businessProvider.selectedPlan != 0)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14.w, vertical: 20.h),
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '₹ ${businessProvider.plans[businessProvider.selectedPlan]['price']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: semiBold,
                                      fontSize: 22.sp,
                                      color: headingColor,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: CustomButton(
                buttonName: businessProvider.selectedPlan == 0
                    ? "Continue"
                    : "Pay Now", // Button text changes based on plan
                onPressed: () {
                  if (businessProvider.selectedPlan == 0) {

                    businessProvider.onPaymentSubmit(context);
                  } else {
                    // Implement payment flow for paid plans here.
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
