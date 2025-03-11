import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar2.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account.dart';
import 'package:deals_on_map/modules/business/views/business_create_account/create_business_account1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar2(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  businessBannerImg,
                  height: 132.h,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 13.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFEDFFF1),
                      ],
                      stops: [0.0, 1.0],
                    ),
                    border: Border.all(color: brdColor, width: 1.w),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        businessContIc,
                        width: 158.w,
                        height: 140.h,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 26.h),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Get Your Business Discovered with\n',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: regular,
                            fontWeight: FontWeight.w500,
                            color: headingColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Deal on Map! ',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: regular,
                                fontWeight: FontWeight.w500,
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 26.h),
                      CustomButton(buttonName: "Create Account", onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateBusinessAccount()));
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 13.h),
                Text(
                  'What Deal on Map Offers',
                  style: TextStyle(
                    fontFamily: medium,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 6.h),
                ListView.builder(
                  itemCount: 4,                        
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 3),
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
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
