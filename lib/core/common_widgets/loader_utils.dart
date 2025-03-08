import 'package:flutter/material.dart';

class LoaderUtils {
  static void showLoader(
    BuildContext context, {
    double size = 100.0,
    Color backgroundColor = Colors.white,
    Color indicatorColor = Colors.green,
    double borderRadius = 10.0,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Center(
            child: Container(
              height: size,
              width: size,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: CircularProgressIndicator.adaptive(
                backgroundColor: indicatorColor,
              ),
            ),
          ),
        );
      },
    );
  }

  static void removeLoader(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }
}
