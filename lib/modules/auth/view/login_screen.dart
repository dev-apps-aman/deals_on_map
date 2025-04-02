import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/modules/auth/provider/auth_provider.dart';
import 'package:deals_on_map/modules/dashboard/view/dashboard_screen.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.pushAndRemoveUntil(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const Dashboard(index: 0)),
              //           (route) => false,
              //         );
              //       },
              //       child: Container(
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 17.w, vertical: 4.h),
              //         margin: EdgeInsets.only(top: 10.h, right: 10.w),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(6),
              //             border:
              //                 Border.all(color: secondaryFontColor, width: 1)),
              //         child: const Text(
              //           'Skip',
              //           style: TextStyle(
              //             fontSize: 12,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: regular,
              //             color: mainColor,
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(height: 20),
              Image.asset(
                logoIc,
                height: 84,
                width: 180,
              ),
              SizedBox(height: 12.h),
              Text(
                textAlign: TextAlign.center,
                'Finding the Best Offer Deal near your\nLocation',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  fontFamily: regular,
                  color: textColor,
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: dividerColor,
                    ),
                  ),
                  Text(
                    'Log in or Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      fontFamily: regular,
                      color: headingColor,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: dividerColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        Log.console(number.dialCode);
                        authProvider
                            .onCountryChange(number.dialCode.toString());
                      },
                      onInputValidated: (bool value) {
                        Log.console(value);
                      },
                      inputDecoration: InputDecoration(
                        counterText: "",
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        hintText: "Enter Your Mobile Number",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: secondaryFontColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: regular,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: brdColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: brdColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: focusedBrdColor,
                          ),
                        ),
                      ),
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      searchBoxDecoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brdColor))),
                      selectorTextStyle: TextStyle(
                        color: headingColor,
                        fontSize: 14.sp,
                        fontFamily: regular,
                        fontWeight: FontWeight.w500,
                      ),
                      initialValue: PhoneNumber(isoCode: 'IN'),
                      spaceBetweenSelectorAndTextField: 0,
                      textFieldController: authProvider.mobileController,
                      selectorButtonOnErrorPadding: 2,
                      formatInput: false,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.dm),
                        borderSide: const BorderSide(
                          color: brdColor,
                        ),
                      ),
                      onSaved: (PhoneNumber number) {
                        Log.console('On Saved: $number');
                      },
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                        buttonName: "Continue",
                        onPressed: () {
                          authProvider.loginApi(context);
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
