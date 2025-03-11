import 'dart:io';

import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_progress_bar.dart';
import 'package:deals_on_map/modules/auth/provider/auth_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotos extends StatefulWidget {
  const AddPhotos({super.key});

  @override
  State<AddPhotos> createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Customize Profile"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomProgressBar(totalPage: 3, currentPage: 3, isLoading: true),
              SizedBox(height: 26.h),
              Text(
                'upload Your Business Photos',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: medium,
                  fontWeight: FontWeight.w500,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Let Your Business Shine with Stunning Images',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: regular,
                  fontWeight: FontWeight.w400,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 26.h),
              DottedBorder(
                  dashPattern: const [6, 6],
                  color: dividerColor,
                  strokeWidth: 1,
                  radius: Radius.circular(30.dm),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.dm),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 27.h),
                    height: 74.h,
                    width: 78.w,
                    child: Image.asset(
                      addIc,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.contain,
                    ),
                  )),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: CustomButton(buttonName: "Save", onPressed: () {}),
        ),
      ),
    );
  }

  Future<void> showImagePicker(BuildContext context, AuthProvider authProvider) async {
    final ImagePicker picker = ImagePicker();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () async {
                final XFile? image = await picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  final File imageFile = File(image.path);
                  authProvider.updateImage(imageFile);
                }
                Navigator.pop(context);
              },
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
            ),
            ListTile(
              onTap: () async {
                final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  final File imageFile = File(image.path);
                  authProvider.updateImage(imageFile);
                }
                Navigator.pop(context);
              },
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
