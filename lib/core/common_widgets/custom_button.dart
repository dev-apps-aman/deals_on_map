import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double fontSize;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.fontSize = 14.0,
    this.borderRadius = 10.0,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 45,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: backgroundColor ?? mainColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor ?? Colors.transparent,
              )),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: regular,
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
