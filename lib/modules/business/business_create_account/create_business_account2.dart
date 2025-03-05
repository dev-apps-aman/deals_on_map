import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/modules/business/business_create_account/create_business_account3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateBusinessAccount2 extends StatefulWidget {
  const CreateBusinessAccount2({super.key});

  @override
  State<CreateBusinessAccount2> createState() => _CreateBusinessAccount2State();
}

class _CreateBusinessAccount2State extends State<CreateBusinessAccount2> {
  bool isSelected = false;
  bool isSelectedRetail = false;
  bool isSelectedStore = false;
  bool isSelectedService = false;

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
                'Choose Your Business Type',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: medium,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Select All That Apply To Aamod ItSolutions',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: regular,
                  color: secondaryFontColor,
                ),
              ),
              SizedBox(height: 22.h),
              buildContainer(
                "Online Retail",
                "Customers can purchase products through your\nWebsite",
                retailIc,
                isSelectedRetail,
                (value) {
                  setState(() {
                    isSelectedService = false;
                    isSelectedRetail = value!;
                    isSelectedStore = false;
                  });
                },
              ),
              SizedBox(height: 13.h),
              buildContainer(
                "Local Store",
                "Customers can visit your business in person",
                retailIc,
                isSelectedStore,
                (value) {
                  setState(() {
                    isSelectedService = false;
                    isSelectedRetail = false;
                    isSelectedStore = value!;
                  });
                },
              ),
              SizedBox(height: 13.h),
              buildContainer(
                "Service Business",
                "Your business makes visits to customers",
                retailIc,
                isSelectedService,
                (value) {
                  setState(() {
                    isSelectedService = value!;
                    isSelectedRetail = false;
                    isSelectedStore = false;
                  });
                },
              ),
              SizedBox(height: 30.h),
              CustomButton(buttonName: "Continue", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateBusinessAccount3()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(
      String title,
      String description,
      String imagePath,
      bool isSelected,
      ValueChanged<bool?> onChanged,
      ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? mainColor : businessBrdColor,
          width: 1.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 26.h,
            width: 26.h,
          ),
          SizedBox(width: 7.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: regular,
                    color: headingColor,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: regular,
                    color: focusedBrdColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Checkbox(
            value: isSelected,
            side: BorderSide(width: 1.w, color: unselectedFontColor),
            visualDensity: VisualDensity.compact,
            onChanged: onChanged,
            activeColor: mainColor,
            checkColor: Colors.white,
          ),
        ],
      ),
    );
  }

}
