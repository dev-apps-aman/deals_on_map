// ignore_for_file: must_be_immutable, unused_import

import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  String? labelText;
  BorderRadius? borderRadius;
  TextEditingController? controller;
  TextInputType? txKeyboardType;
  Color? borderCl;
  Color? iconCl;
  Color? color;
  Color? fillColor;
  Widget? leading1;
  Widget? leading2;

  CustomSearchBar({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.borderRadius,
    this.txKeyboardType,
    this.borderCl,
    this.iconCl,
    this.color,
    this.leading1,
    this.leading2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: const Color(0xFFD0DED4), width: 1),
        borderRadius: borderRadius,
      ),
      child: TextField(
        controller: controller,
        keyboardType: txKeyboardType,
        decoration: InputDecoration(contentPadding: const EdgeInsets.only(left: 10,top: 10),
          hintText: hintText,
          labelText: labelText,
          fillColor: fillColor,
          hintStyle: const TextStyle(
            color: unselectedFontColor,
            fontSize: 12,
            fontFamily: regular,
            fontWeight: FontWeight.w400,
          ),
          labelStyle: TextStyle(
            color: borderCl,
            fontSize: 16,
          ),
          border: InputBorder.none,
          prefixIcon: leading1,
          suffixIcon: leading2,
        ),
      ),
    );
  }
}
