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

class CreateBusinessAccount5 extends StatefulWidget {
  const CreateBusinessAccount5({super.key});

  @override
  State<CreateBusinessAccount5> createState() => _CreateBusinessAccount5State();
}

class _CreateBusinessAccount5State extends State<CreateBusinessAccount5> {
  @override
  void initState() {
    super.initState();
    // Provider.of<BusinessAuthProvider>(context, listen: false)
    //     .fetchCountryList(context);
  }

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
                SizedBox(height: 20.h),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Provider.of<BusinessAuthProvider>(context, listen: false)
                        .fetchCurrentLoc(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      color: greeenFAEF,
                      border: Border.all(color: greeenCFBB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          curLocGreenIc,
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Text(
                            'Using My current Location',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: regular,
                              color: headingColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          sendRedIc,
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
                Consumer<BusinessAuthProvider>(
                  builder: (context, businessAuthProvider, child) {
                    return CustomTextField(
                      controller: businessAuthProvider.countryController,
                      borderRadius: 10,
                      readOnly: true,
                      fillColor: Colors.white,
                      borderCl: unselectedFontColor,
                      hintText: "Country",
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
                Consumer<BusinessAuthProvider>(
                  builder: (context, businessAuthProvider, child) {
                    return CustomTextField(
                      controller: businessAuthProvider.stateController,
                      borderRadius: 10,
                      readOnly: true,
                      fillColor: Colors.white,
                      borderCl: unselectedFontColor,
                      hintText: "State",
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
                Consumer<BusinessAuthProvider>(
                  builder: (context, businessAuthProvider, child) {
                    return CustomTextField(
                      controller: businessAuthProvider.cityController,
                      borderRadius: 10,
                      readOnly: true,
                      fillColor: Colors.white,
                      borderCl: unselectedFontColor,
                      hintText: "City",
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
                Consumer<BusinessAuthProvider>(
                  builder: (context, businessAuthProvider, child) {
                    return CustomTextField(
                      controller: businessAuthProvider.sAddressController,
                      borderRadius: 10,
                      readOnly: true,
                      fillColor: Colors.white,
                      borderCl: unselectedFontColor,
                      hintText: "House and shop Address",
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
                Consumer<BusinessAuthProvider>(
                  builder: (context, businessAuthProvider, child) {
                    return CustomTextField(
                      controller: businessAuthProvider.pinCodeController,
                      borderRadius: 10,
                      readOnly: true,
                      fillColor: Colors.white,
                      borderCl: unselectedFontColor,
                      hintText: "Pincode",
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
                Consumer<BusinessAuthProvider>(
                  builder: (context, businessAuthProvider, child) {
                    return CustomButton(
                      buttonName: "Continue",
                      onPressed: () {
                        businessAuthProvider.onBussAddressSubmit(context);
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

  // Widget buildDropdown({
  //   String? label,
  //   required String? value,
  //   required String hint,
  //   required List<String> items,
  //   required ValueChanged<String?> onChanged,
  //   bool isLoading = false,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       label == "" || label == null
  //           ? const SizedBox.shrink()
  //           : Text(
  //               label,
  //               style: TextStyle(
  //                 fontSize: 14.sp,
  //                 fontWeight: FontWeight.w500,
  //                 color: fontColor,
  //                 fontFamily: regular,
  //               ),
  //             ),
  //       label == "" || label == null
  //           ? const SizedBox.shrink()
  //           : const SizedBox(height: 8),
  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(color: unselectedFontColor),
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //         child: isLoading
  //             ? const Center(
  //                 child: Padding(
  //                   padding: EdgeInsets.symmetric(vertical: 15),
  //                   child: CircularProgressIndicator(),
  //                 ),
  //               )
  //             : DropdownButtonHideUnderline(
  //                 child: DropdownButton2<String?>(
  //                   buttonStyleData: ButtonStyleData(
  //                     height: 50.h,
  //                     width: double.infinity,
  //                     padding: const EdgeInsets.only(left: 14, right: 14),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(8),
  //                       border: Border.all(color: Colors.transparent),
  //                     ),
  //                   ),
  //                   iconStyleData: const IconStyleData(
  //                     icon: Icon(Icons.arrow_drop_down, size: 24),
  //                     iconSize: 14,
  //                     iconEnabledColor: Colors.black,
  //                     iconDisabledColor: Colors.grey,
  //                   ),
  //                   dropdownStyleData: DropdownStyleData(
  //                     padding: const EdgeInsets.symmetric(horizontal: 15),
  //                     maxHeight: 200,
  //                     width: MediaQuery.of(context).size.width * 0.90,
  //                     useSafeArea: true,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(14),
  //                       color: Colors.white,
  //                     ),
  //                     scrollbarTheme: ScrollbarThemeData(
  //                       radius: const Radius.circular(40),
  //                       thickness: WidgetStateProperty.all(6),
  //                       thumbVisibility: WidgetStateProperty.all(true),
  //                     ),
  //                   ),
  //                   menuItemStyleData: const MenuItemStyleData(
  //                     height: 48,
  //                     padding: EdgeInsets.only(left: 14, right: 14),
  //                   ),
  //                   isDense: true,
  //                   value: value,
  //                   hint: Text(
  //                     hint,
  //                     style: const TextStyle(
  //                       fontWeight: FontWeight.w500,
  //                       color: unselectedFontColor,
  //                       fontSize: 14,
  //                     ),
  //                   ),
  //                   style: const TextStyle(
  //                     color: Colors.white60,
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                   isExpanded: true,
  //                   items: items.isEmpty
  //                       ? []
  //                       : items.map((item) {
  //                           return DropdownMenuItem<String>(
  //                             value: item,
  //                             child: Text(
  //                               item,
  //                               style: const TextStyle(
  //                                 color: Colors.black,
  //                                 fontSize: 14,
  //                                 fontWeight: FontWeight.w500,
  //                                 fontFamily: regular,
  //                               ),
  //                             ),
  //                           );
  //                         }).toList(),
  //                   onChanged: onChanged,
  //                 ),
  //               ),
  //       ),
  //     ],
  //   );
  // }
}
