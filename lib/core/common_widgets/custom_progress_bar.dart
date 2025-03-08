import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressBar extends StatelessWidget {
  final int totalPage;
  final int currentPage;
  final bool isLoading;

  const CustomProgressBar(
      {super.key,
      required this.totalPage,
      required this.currentPage,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    double progress = (currentPage) / totalPage;

    if (progress < 0.3) {
    } else if (progress < 0.6) {
    } else {}

    return Stack(
      children: [
        if (isLoading)
          Container(
            height: 10.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: appBarBdrColor, borderRadius: BorderRadius.circular(10)),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      '$currentPage of $totalPage',
                      style: const TextStyle(
                        fontFamily: regular,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400.w,
                  height: 50.w,
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.transparent,
                    color: mainColor,
                    minHeight: 3.h,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
