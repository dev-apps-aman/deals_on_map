import 'package:carousel_slider/carousel_slider.dart';
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsOfServices extends StatefulWidget {
  const DetailsOfServices({super.key});

  @override
  State<DetailsOfServices> createState() => _DetailsOfServicesState();
}

class _DetailsOfServicesState extends State<DetailsOfServices> {
  int currentIndex = 0;
  CarouselSliderController carouselSliderController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(clipBehavior: Clip.none, children: [
                Image.asset(
                  detailsImg,
                  width: MediaQuery.of(context).size.width,
                  height: 230.h,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 24.h,
                        width: 24.w,
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFF000000).withOpacity(0.60),
                        ),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        height: 24.h,
                        width: 24.w,
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFF000000).withOpacity(0.60),
                        ),
                        child: Image.asset(
                          shareArrowIc,
                          width: 18.w,
                          height: 15.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                      margin: EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 1),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  'Shree Shyam Saloni Sweet Caterers',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: medium,
                                    color: headingColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              const Icon(
                                Icons.favorite_outline_rounded,
                                size: 20,
                                color: unselectedFontColor,
                              )
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    verifyIc,
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'Verified',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: regular,
                                      color: headingColor,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 30.w),
                              Row(
                                children: [
                                  Image.asset(
                                    offlineIc,
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'Offline',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: regular,
                                      color: secondaryColor,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 30.w),
                              Row(
                                children: [
                                  Image.asset(
                                    onlineIc,
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'Online',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: regular,
                                      color: secondaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          const Divider(
                            color: brdColor,
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Image.asset(
                                locationIc,
                                height: 24.h,
                                width: 24.w,
                                color: focusedBrdColor,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                'Address',
                                style: TextStyle(
                                  fontFamily: regular,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: focusedBrdColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            'Plot No. 79/127, Shipra Path, Mansarovar, Jaipur - 302020 (Opposite Land Scape Park)',
                            style: TextStyle(
                              fontFamily: regular,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: secondaryColor,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: linkColor,
                                    )),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      directionIc,
                                      height: 24.h,
                                      width: 24.w,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(width: 15.w),
                                    Text(
                                      'Get Directions',
                                      style: TextStyle(
                                        fontFamily: regular,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: linkColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: unselectedFontColor,
                                    )),
                                child: Image.asset(
                                  copyIc,
                                  height: 24.h,
                                  width: 24.w,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ]),
              SizedBox(height: 200.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Services',
                      style: TextStyle(
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Icon(
                                Icons.check_outlined,
                                size: 20.sp,
                                color: mainColor,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                'Kitty Party',
                                style: TextStyle(
                                  fontFamily: regular,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: headingColor,
                                ),
                              ),
                            ],
                          );
                        }),
                    SizedBox(height: 15.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF2E9),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
                            child: Text(
                              'Videos',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: regular,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 110.h,
                            child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 170.w,
                                  height: 98.h,
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 10, spreadRadius: 0, color: Colors.grey.withOpacity(0.05))],
                                  ),
                                  child: Image.asset(
                                    businessImg,
                                    height: 100,
                                    width: 155.w,
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'About Us',
                      style: TextStyle(
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      textAlign: TextAlign.start,
                      'Rorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.\nRorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac Se',
                      style: TextStyle(
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: secondaryColor,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Contact Info.',
                      style: TextStyle(
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Image.asset(
                          webIc,
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Website',
                          style: TextStyle(
                            fontFamily: regular,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: headingColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'https://aamoditsolutions.com/',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: regular,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: headingColor,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: linkColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            linkIc,
                            height: 24.h,
                            width: 24.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 15.w),
                          Text(
                            'Visit Website',
                            style: TextStyle(
                              fontFamily: regular,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: linkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Image.asset(
                          webIc,
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Follow Us',
                          style: TextStyle(
                            fontFamily: regular,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: headingColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Image.asset(
                          fbIc,
                          height: 20.h,
                          width: 20.w,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 16.w),
                        Image.asset(
                          instaIc,
                          height: 20.h,
                          width: 20.w,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 16.w),
                        Image.asset(
                          whatsappIc,
                          height: 20.h,
                          width: 20.w,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 16.w),
                        Image.asset(
                          ytIc,
                          height: 20.h,
                          width: 20.w,
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0x40000000),
                offset: Offset(0, 1),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: brdColor,
                width: 1.w,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12, bottom: 12, right: 14, left: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mainColor,
                ),
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                padding: const EdgeInsets.only(top: 12, bottom: 12, right: 14, left: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: headingColor,
                    width: 1.w,
                  ),
                ),
                child: Image.asset(
                  whatsappFillIc,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: linkColor,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      chatIc,
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Send Enquire',
                      style: TextStyle(
                        fontFamily: regular,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
