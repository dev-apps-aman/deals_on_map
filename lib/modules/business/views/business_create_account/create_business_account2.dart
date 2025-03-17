import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/modules/business/provider/business_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateBusinessAccount2 extends StatelessWidget {
  const CreateBusinessAccount2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Create Account"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
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
                  'Select the most appropriate type for your business',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: regular,
                    color: secondaryFontColor,
                  ),
                ),
                SizedBox(height: 22.h),
                Consumer<BusinessProvider>(
                  builder: (context, provider, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.businessTypes.length,
                      itemBuilder: (context, index) {
                        final business = provider.businessTypes[index];
                        final isSelected =
                            provider.selectedType == business["title"];

                        return buildContainer(
                          business["title"],
                          business["description"],
                          business["imagePath"],
                          isSelected,
                          () {
                            provider.setSelectedBusinessType(business["title"]);
                          },
                          provider,
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  buttonName: "Continue",
                  onPressed: () {
                    context
                        .read<BusinessProvider>()
                        .onBusinessTypeSubmit(context);
                  },
                ),
              ],
            ),
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
    VoidCallback onTap,
    dynamic provider,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 13.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? mainColor : businessBrdColor,
            width: 1.w,
          ),
          color: isSelected ? mainColor.withOpacity(0.1) : Colors.transparent,
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
            SizedBox(width: 7.w),
            Radio<String>(
              value: title,
              groupValue: provider.selectedType,
              onChanged: (_) => onTap(),
              activeColor: mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
