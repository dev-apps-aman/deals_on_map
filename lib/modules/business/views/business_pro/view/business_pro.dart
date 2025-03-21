// ignore_for_file: unused_import

import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';
import 'package:deals_on_map/core/common_widgets/custom_otp_fileds.dart';
import 'package:deals_on_map/modules/auth/provider/auth_provider.dart';
import 'package:deals_on_map/modules/business/provider/business_provider.dart';
import 'package:deals_on_map/modules/business/views/business_dashboard/view/business_dashboard.dart';
import 'package:deals_on_map/modules/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BusinessPro extends StatefulWidget {
  const BusinessPro({super.key});

  @override
  State<BusinessPro> createState() => _BusinessProState();
}

class _BusinessProState extends State<BusinessPro> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                  color: Color(0xFF1BAA41).withAlpha(180),
                                  offset: Offset(0, 0),
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
                        Text(
                          'Benefit of Plan',
                          style: TextStyle(
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        // MediaQuery.removePadding(
                        //   context: context,
                        //   removeTop: true,
                        //   child: ListView.builder(
                        //     itemCount: 4,
                        //     shrinkWrap: true,
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     itemBuilder: (context, index) {
                        //       return Row(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         children: [
                        //           Container(
                        //             padding: const EdgeInsets.only(
                        //                 top: 3, bottom: 3, left: 3, right: 3),
                        //             margin: const EdgeInsets.only(bottom: 10),
                        //             decoration: const BoxDecoration(
                        //               shape: BoxShape.circle,
                        //               color: mainColor,
                        //             ),
                        //             child: Icon(
                        //               Icons.check_outlined,
                        //               size: 20.sp,
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //           SizedBox(width: 8.w),
                        //           Text(
                        //             'Enhance your business visibility',
                        //             style: TextStyle(
                        //               fontFamily: regular,
                        //               fontWeight: FontWeight.w400,
                        //               fontSize: 12.sp,
                        //               color: secondaryFontColor,
                        //             ),
                        //           ),
                        //         ],
                        //       );
                        //     },
                        //   ),
                        // ),
                        SizedBox(height: 30.h),
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
                                      'Pro',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: semiBold,
                                        fontSize: 22.sp,
                                        color: headingColor,
                                      ),
                                    ),
                                    SizedBox(height: 3.h),
                                    Text(
                                      'You Can Promote Your Business ',
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
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 20.h),
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '₹ 999',
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
                buttonName: "Pay Now",
                onPressed: () {
                  // context.read<BusinessProvider>().onSellerRegister(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const BusinessDashboard()));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
