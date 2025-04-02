import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar2.dart';
import 'package:deals_on_map/core/common_widgets/custom_search_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
                child: CustomSearchBar(
                  leading1: buildSearchDropdown(
                    value: selectedItem,
                    hint: 'All',
                    onChanged: (newValue) {
                      selectedItem = newValue;
                    },
                  ),
                  leading2: Container(
                    decoration: const BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    child: const Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 14.h),
                        child: Row(
                          children: [
                            Image.asset(
                              profileIcon,
                              height: 30.h,
                              width: 30.w,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 7.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Aamod itsolution',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: focusedBrdColor,
                                    fontFamily: regular,
                                  ),
                                ),
                                Text(
                                  'Offline',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: secondaryFontColor,
                                    fontFamily: regular,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            offersImg,
                            width: MediaQuery.of(context).size.width,
                            height: 375.h,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: const Color(0xFF000000).withAlpha(30),
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_outline_rounded,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        '120K',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontFamily: regular,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 22.w),
                                  Row(
                                    children: [
                                      Image.asset(
                                        picShareIC,
                                        height: 24.h,
                                        width: 24.w,
                                      ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        '200',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontFamily: regular,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Lorem Ipsum is simply dummy text of the... More',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: focusedBrdColor,
                          fontFamily: regular,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchDropdown({
    required String? value,
    required String hint,
    required ValueChanged<String?> onChanged,
  }) {
    List<String> items = [
      'United States',
      'Canada',
      'United Kingdom',
      'Australia',
      'India',
      'Germany',
      'France',
      'Japan',
      'China',
      'South Korea',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            buttonStyleData: ButtonStyleData(
              height: 55.h,
              width: 65.w,
              padding: const EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: brdColor,
                ),
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                size: 20,
              ),
              iconSize: 14,
              iconEnabledColor: headingColor,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: MediaQuery.of(context).size.width * 0.45,
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
                fontWeight: FontWeight.w400,
                color: secondaryFontColor,
                fontSize: 12,
              ),
            ),
            style: const TextStyle(
                color: Colors.white60,
                fontSize: 12,
                fontWeight: FontWeight.w400),
            isExpanded: true,
            items: items.map((v) {
              return DropdownMenuItem<String>(
                value: v,
                child: Text(
                  items.toString(),
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
      ],
    );
  }
}
