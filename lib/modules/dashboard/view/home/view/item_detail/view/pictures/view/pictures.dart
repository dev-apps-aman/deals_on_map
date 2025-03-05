import 'package:deals_on_map/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pictures extends StatefulWidget {
  const Pictures({super.key});

  @override
  State<Pictures> createState() => _PicturesState();
}

class _PicturesState extends State<Pictures> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              MediaQuery.removePadding(
                context: context,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 0,
                    childAspectRatio: 0.99,
                  ),
                  shrinkWrap: true,
                  itemCount: 12,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Image.asset(
                      picturesImages,
                      height: 124.h,
                      width: 124.w,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
