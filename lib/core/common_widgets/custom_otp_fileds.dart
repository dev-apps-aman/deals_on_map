
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomOtpFileds extends StatelessWidget {

  const CustomOtpFileds({super.key});

  @override
  Widget build(BuildContext context) {
    //final authProvider = Provider.of<AuthProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.70,
      child: PinCodeTextField(
        cursorColor: mainColor,
        keyboardType: TextInputType.number,
        obscureText: false,
        obscuringCharacter: "*",
        textStyle: const TextStyle(
          //color: darkTitle,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal, fontFamily: regular
        ),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 46,
          fieldWidth: 50,
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
        length: 4,
        onChanged: (String value) {
         // authProvider.updateOtp(value);
        },
      ),
    );
  }
}
