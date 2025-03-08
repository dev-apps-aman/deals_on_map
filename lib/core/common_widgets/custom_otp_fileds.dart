import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/modules/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class CustomOtpFileds extends StatelessWidget {
  final int otpLength;
  const CustomOtpFileds({super.key, this.otpLength = 6});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: PinCodeTextField(
        cursorColor: mainColor,
        keyboardType: TextInputType.number,
        obscureText: false,
        obscuringCharacter: "*",
        textStyle: const TextStyle(
            //color: darkTitle,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: regular),
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
          activeBorderWidth: 1,
          selectedBorderWidth: 1,
          disabledBorderWidth: 1,
          inactiveBorderWidth: 1,
          errorBorderWidth: 1,
          borderWidth: 1,
        ),
        appContext: context,
        length: otpLength,
        onChanged: (String value) {
          authProvider.updateOtp(value);
        },
      ),
    );
  }
}
