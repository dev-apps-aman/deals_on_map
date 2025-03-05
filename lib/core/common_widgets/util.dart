// ignore_for_file: deprecated_member_use
import 'package:deals_on_map/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showToast(BuildContext context, String msg, Color bgColor, Color textColor) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 50,
      left: 10,
      right: 10,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  msg,
                  style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}

void successToast(BuildContext context, String msg) {
  showToast(context, msg, Colors.white, Colors.green);
}

void errorToast(BuildContext context, String msg) {
  showToast(context, msg, Colors.white, Colors.red);
}

void showProgress(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0.35),
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.h,width: 200,
              padding:  EdgeInsets.all(50.h),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: CircularProgressIndicator(color: mainColor),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void closeProgress(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
