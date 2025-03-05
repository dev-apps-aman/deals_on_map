import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/modules/dashboard/view/profile/view/delete/view/delete_reason_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteSheet {
  static show(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Flexible(
                child: Text(
                  'Are you sure you want to Delete your account?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, fontFamily: regular),
                ),
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                        buttonName: 'Yes',
                        onPressed: () {
                          DeleteReasonSheet.show(context);
                        }),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomButton(
                        buttonName: 'No',
                        backgroundColor: Colors.white,
                        borderColor: secondaryColor,
                        textColor: headingColor,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
