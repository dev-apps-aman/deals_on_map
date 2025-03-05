import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? widget;

  const CustomAppBar({super.key, required this.title, this.widget});

  @override
  Size get preferredSize => Size.fromHeight(65.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: customAppBarColor,
      automaticallyImplyLeading: false,
      leadingWidth: MediaQuery.of(context).size.width,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: 24.h,
              width: 24.w,
              child: const Icon(
                Icons.arrow_back_outlined,
                size: 20,
                color: fontColor,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            title,
            style: TextStyle(
              color: fontColor,
              fontFamily: regular,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
      actions: [
        widget??const SizedBox()
      ],
    );
  }
}
