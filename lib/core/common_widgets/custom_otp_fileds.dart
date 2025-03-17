import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomOtpFields extends StatelessWidget {
  final int otpLength;
  final Function(String) onOtpChanged;

  const CustomOtpFields({
    super.key,
    this.otpLength = 6,
    required this.onOtpChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: PinCodeTextField(
        cursorColor: mainColor,
        keyboardType: TextInputType.number,
        obscureText: false,
        obscuringCharacter: "*",
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: regular,
        ),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 40,
          fieldWidth: 40,
          fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 6),
          activeFillColor: brdColor,
          inactiveFillColor: brdColor,
          selectedFillColor: headingColor,
          selectedColor: headingColor,
          disabledColor: brdColor,
          inactiveColor: brdColor,
          activeColor: headingColor,
          errorBorderColor: brdColor,
          borderWidth: 1,
        ),
        appContext: context,
        length: otpLength,
        onChanged: (String value) {
          onOtpChanged(value);
        },
      ),
    );
  }
}
