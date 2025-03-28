import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => AccountState();
}

class AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Services',
                  style: TextStyle(
                    fontFamily: medium,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.h),
                ListView.separated(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 15.h) ,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Icon(
                            Icons.check_outlined,
                            size: 20.sp,
                            color: mainColor,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Kitty Party',
                            style: TextStyle(
                              fontFamily: regular,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: headingColor,
                            ),
                          ),
                        ],
                      );
                    }),
                SizedBox(height: 15.h),
                Text(
                  'About Us',
                  style: TextStyle(
                    fontFamily: medium,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  textAlign: TextAlign.start,
                  'Rorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.\nRorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac Se',
                  style: TextStyle(
                    fontFamily: regular,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: secondaryColor,
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Contact Info.',
                  style: TextStyle(
                    fontFamily: medium,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Image.asset(
                      webIc,
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'Website',
                      style: TextStyle(
                        fontFamily: regular,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: headingColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Text(
                  'https://aamoditsolutions.com/',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: regular,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: headingColor,
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: linkColor,
                      )),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        linkIc,
                        height: 24.h,
                        width: 24.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        'Visit Website',
                        style: TextStyle(
                          fontFamily: regular,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: linkColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Image.asset(
                      webIc,
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'Follow Us',
                      style: TextStyle(
                        fontFamily: regular,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: headingColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Image.asset(
                      fbIc,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 16.w),
                    Image.asset(
                      instaIc,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 16.w),
                    Image.asset(
                      whatsappIc,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 16.w),
                    Image.asset(
                      ytIc,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Image.asset(
                      locationIc,
                      height: 24.h,
                      width: 24.w,
                      color: focusedBrdColor,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'Address',
                      style: TextStyle(
                        fontFamily: regular,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: focusedBrdColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  'Plot No. 79/127, Shipra Path, Mansarovar, Jaipur - 302020 (Opposite Land Scape Park)',
                  style: TextStyle(
                    fontFamily: regular,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: secondaryColor,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: linkColor,
                          )),
                      child: Row(
                        children: [
                          Image.asset(
                            directionIc,
                            height: 24.h,
                            width: 24.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 15.w),
                          Text(
                            'Get Directions',
                            style: TextStyle(
                              fontFamily: regular,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: linkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: unselectedFontColor,
                          )),
                      child: Image.asset(
                        copyIc,
                        height: 24.h,
                        width: 24.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
