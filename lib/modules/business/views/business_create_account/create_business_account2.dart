import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/modules/business/provider/business_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:deals_on_map/modules/business/models/business_type_model.dart'; // ✅ Model import

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
                      itemCount: provider.businessTypesList.length,
                      itemBuilder: (context, index) {
                        final BusinessTypeModel business =
                            provider.businessTypesList[index];
                        final bool isSelected =
                            provider.selectedBusinessType == business;

                        return buildContainer(
                          business,
                          isSelected,
                          () {
                            provider.setSelectedBusinessType(business);
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
    BusinessTypeModel business,
    bool isSelected,
    VoidCallback onTap,
    BusinessProvider provider,
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
          color: isSelected ? mainColor.withAlpha(25) : Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              business.imagePath, // ✅ Direct model se data le rahe hain
              height: 26.h,
              width: 26.h,
            ),
            SizedBox(width: 7.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    business.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: regular,
                      color: headingColor,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    business.description,
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
            Radio<BusinessTypeModel>(
              value: business,
              groupValue: provider.selectedBusinessType,
              onChanged: (_) => onTap(),
              activeColor: mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
