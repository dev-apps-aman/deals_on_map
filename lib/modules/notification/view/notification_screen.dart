import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Notification"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 14.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: appBarBdrColor,
                            width: 1.w,
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            gridItemImg,
                            height: 45,
                            width: 45,
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '30% Dis. Flat in Store',
                                  style: TextStyle(
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: headingColor,
                                  ),
                                ),
                                //SizedBox(height: 10.h),
                                Text(
                                  maxLines: 3,
                                  textAlign: TextAlign.start,
                                  'Yorem ipsum dolor sit amet, consectetur adipiscing elit.\nNunc vulputate libero et velit interdum, ac aliquet odio\nmattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                                  style: TextStyle(
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: headingColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '30 Min.',
                            style: TextStyle(
                              fontFamily: regular,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
