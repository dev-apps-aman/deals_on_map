import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatelessWidget {
  final String? label;
  final String? value;
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final bool isLoading;
  const CustomDropdown(
      {super.key,
      this.label,
      this.value,
      required this.hint,
      required this.items,
      required this.onChanged,
      this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label!,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: fontColor,
                  fontFamily: regular,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
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
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              isExpanded: true,

              // ✅ Loader Ko Dropdown List Me Show Karne Ka Logic
              items: isLoading
                  ? [
                      DropdownMenuItem<String>(
                        value: null,
                        enabled: false,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: regular,
                          ),
                        ),
                      );
                    }).toList(),
              onChanged: isLoading ? null : onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildDropdown({
  String? label,
  required String? value,
  required String hint,
  required List<String> items,
  required ValueChanged<String?> onChanged,
  bool isLoading = false,
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (label != null && label.isNotEmpty)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: fontColor,
                fontFamily: regular,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
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
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            isExpanded: true,
            items: isLoading
                ? [
                    DropdownMenuItem<String>(
                      value: null,
                      enabled: false,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ]
                : items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: regular,
                        ),
                      ),
                    );
                  }).toList(),
            onChanged: isLoading ? null : onChanged,
          ),
        ),
      ),
    ],
  );
}
