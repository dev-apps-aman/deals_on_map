import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/modules/dashboard/view/home/provider/home_provider.dart';
import 'package:deals_on_map/modules/notification/view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomAppBar2 extends StatefulWidget implements PreferredSizeWidget {
  final Widget? widget;

  const CustomAppBar2({
    super.key,
    this.widget,
  });

  @override
  State<CustomAppBar2> createState() => _CustomAppBar2State();

  @override
  Size get preferredSize => Size.fromHeight(65.h);
}

class _CustomAppBar2State extends State<CustomAppBar2> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leadingWidth: MediaQuery.of(context).size.width,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                locationIc,
                height: 26.h,
                width: 26.w,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                        color: fontColor,
                        fontFamily: regular,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      maxLines: 1,
                      provider.currentLocation,
                      style: TextStyle(
                        color: mainColor,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                },
                child: Icon(
                  Icons.notifications,
                  color: headingColor,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
        actions: [
          widget.widget ?? const SizedBox(),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 2.h),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 2.h,
            decoration: const BoxDecoration(
              color: Color(0xFFECF6EF),
            ),
          ),
        ),
      );
    });
  }
}
