import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';
import 'package:deals_on_map/modules/business/provider/business_provider.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateBusinessAccount5 extends StatefulWidget {
  const CreateBusinessAccount5({super.key});

  @override
  State<CreateBusinessAccount5> createState() => _CreateBusinessAccount5State();
}

class _CreateBusinessAccount5State extends State<CreateBusinessAccount5> {
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
                  textAlign: TextAlign.start,
                  'Enter Your Business Address',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: medium,
                    color: headingColor,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Add a location where customers can visit your business in person',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: regular,
                    color: secondaryFontColor,
                  ),
                ),
                SizedBox(height: 22.h),
                buildStateDropdown(
                  hint: "Country",
                  items: ["Rajasthan", "Gujraat", "Uttrakhand", "Delhi"],
                  value: "Rajasthan",
                  onChanged: (String? value) {
                    Log.console("Selected SubCategory: $value");
                  },
                ),
                SizedBox(height: 20.h),
                buildStateDropdown(
                  hint: "Country",
                  items: ["Rajasthan", "Gujraat", "Uttrakhand", "Delhi"],
                  value: "Rajasthan",
                  onChanged: (String? value) {
                    Log.console("Selected SubCategory: $value");
                  },
                ),
                SizedBox(height: 20.h),
                buildStateDropdown(
                  hint: "Country",
                  items: ["Rajasthan", "Gujraat", "Uttrakhand", "Delhi"],
                  value: "Rajasthan",
                  onChanged: (String? value) {
                    Log.console("Selected SubCategory: $value");
                  },
                ),
                SizedBox(height: 20.h),
                Consumer<BusinessProvider>(
                  builder: (context, businessProvider, child) {
                    return CustomTextField(
                      controller: businessProvider.sAddressController,
                      borderRadius: 10,
                      fillColor: Colors.white,
                      borderCl: unselectedFontColor,
                      hintText: "Street Address",
                      txKeyboardType: TextInputType.phone,
                      maxLength: 10,
                      leading1: Image.asset(
                        locationIc,
                        height: 20.h,
                        width: 20.w,
                        color: unselectedFontColor,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Consumer<BusinessProvider>(
                  builder: (context, businessProvider, child) {
                    return CustomTextField(
                      controller: businessProvider.pinCodeController,
                      borderRadius: 10,
                      fillColor: Colors.white,
                      borderCl: unselectedFontColor,
                      hintText: "Pincode",
                      txKeyboardType: TextInputType.phone,
                      maxLength: 10,
                      leading1: Image.asset(
                        pincodeIc,
                        height: 20.h,
                        width: 20.w,
                        color: unselectedFontColor,
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h),
                Consumer<BusinessProvider>(
                  builder: (context, businessProvider, child) {
                    return CustomButton(
                      buttonName: "Continue",
                      onPressed: () {
                        businessProvider.onBussAddressSubmit(context);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStateDropdown({
    String? label,
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    List<String> states = ["Rajasthan", "Gujraat", "Uttrakhand", "Delhi"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == "" || label == null
            ? const SizedBox.shrink()
            : Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: fontColor,
                fontFamily: regular,
              ),
            ),
        label == "" || label == null
            ? const SizedBox.shrink()
            : const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: unselectedFontColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String?>(
              buttonStyleData: ButtonStyleData(
                height: 50.h,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.transparent),
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.arrow_drop_down, size: 24),
                iconSize: 14,
                iconEnabledColor: Colors.black,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                maxHeight: 200,
                width: MediaQuery.of(context).size.width * 0.90,
                useSafeArea: true,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: WidgetStateProperty.all(6),
                  thumbVisibility: WidgetStateProperty.all(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 48,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
              isDense: true,
              value: value,
              hint: Text(
                hint,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: unselectedFontColor,
                  fontSize: 14,
                ),
              ),
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              isExpanded: true,
              items:
                  states.map((paymentType) {
                    return DropdownMenuItem<String>(
                      value: paymentType,
                      child: Text(
                        paymentType,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: regular,
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
