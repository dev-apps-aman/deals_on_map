import 'package:deals_on_map/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_detail_screen.dart';

class Pictures extends StatelessWidget {
  const Pictures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.99,
          ),
          itemCount: 50,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _openImageDetail(context, index);
              },
              child: Hero(
                tag: 'picture_$index',
                child: Image.asset(
                  picturesImages,
                  height: 124.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _openImageDetail(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImageDetailScreen(
          imageIndex: index,
          imageUrl: picturesImages,
        ),
      ),
    );
  }
}
