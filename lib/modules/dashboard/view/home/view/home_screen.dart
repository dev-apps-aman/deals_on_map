// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar2.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_search_bar.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_list/view/item_list.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  CarouselSliderController carouselSliderController =
      CarouselSliderController();

  final List<Map<String, String>> data = [
    {"name": "Restaurant", "image": restaurentIc},
    {"name": "Real Estate", "image": realEstetIc},
    {"name": "Hotel", "image": hotelIc},
    {"name": "Hospitals", "image": hospitalIc},
    {"name": "Beauty", "image": beautyIc},
    {"name": "Stores", "image": storeIc},
    {"name": "Real Estate", "image": realEstetIc},
    {"name": "Restaurant", "image": restaurentIc},
  ];

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar2(),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchBar(
                  hintText: "Search By...",
                  borderRadius: BorderRadius.circular(6.dm),
                  leading1: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: buildSearchDropdown(
                      value: selectedItem,
                      hint: 'All',
                      onChanged: (newValue) {
                        setState(() {
                          selectedItem = newValue;
                        });
                      },
                    ),
                  ),
                  leading2: Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                      size: 15.sp,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio: 0.95,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return GestureDetector(
                      onTap: () {
                        if (item['name'] == 'Restaurant') {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const DirectoryFilter()),);
                        } else if (item['name'] == 'Real Estate') {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const DirectoryFilter()),);
                        } else if (item['name'] == 'Hotel') {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const DirectoryFilter()),);
                        } else if (item['name'] == 'Hospitals') {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const DirectoryFilter()),);
                        } else if (item['name'] == 'Beauty') {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const DirectoryFilter()),);
                        } else if (item['name'] == 'Stores') {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const DirectoryFilter()),);
                        }
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            item['image']!,
                            height: 56.h,
                            width: 66.w,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            item['name']!,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: regular,
                              color: headingColor,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  buttonName: "View All",
                  textColor: headingColor,
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  borderColor: brdColor,
                ),
                SizedBox(height: 16.h),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CarouselSlider(
                      carouselController: carouselSliderController,
                      options: CarouselOptions(
                        aspectRatio: 2 / .8,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.80,
                        padEnds: false,
                        pauseAutoPlayOnTouch: true,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {},
                      ),
                      items: List.generate(
                        4,
                        (index) => InkWell(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              width: MediaQuery.of(context).size.width * 0.80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                      color: Colors.grey.withAlpha(15))
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  bannerImg,
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  height: 150.h,
                                  fit: BoxFit.fill,
                                ),
                                /*CachedNetworkImage(
                                  height: 160.h,
                                  imageUrl: ApiUrl.imageUrl + bannerImg,
                                  width: MediaQuery.of(context).size.width * 0.80,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: mainColor,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                ),*/
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: const [
                        Color(0xFFF4FAF5),
                        Color(0xFFFFFFFF),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'Real ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: regular,
                                  fontWeight: FontWeight.w500,
                                  color: headingColor,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Estate',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500,
                                      color: mainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemList()));
                            },
                            child: Row(
                              children: [
                                Text(
                                  'View All',
                                  style: TextStyle(
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: secondaryFontColor,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 10,
                                  color: secondaryFontColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: brdColor,
                            width: 1.w,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CarouselSlider(
                                  carouselController: carouselSliderController,
                                  options: CarouselOptions(
                                    aspectRatio: 1 / .60,
                                    autoPlay: false,
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.98,
                                    padEnds: false,
                                    pauseAutoPlayOnTouch: true,
                                    enableInfiniteScroll: false,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    },
                                  ),
                                  items: List.generate(
                                    4,
                                    (index) => InkWell(
                                      onTap: () {},
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.20,
                                          height: 200.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(0, 1),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  color:
                                                      Colors.grey.withAlpha(15))
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              businessImg,
                                              height: 200,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.favorite_outline_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(4, (index) {
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        width: currentIndex == index ? 12 : 8,
                                        height: currentIndex == index ? 12 : 8,
                                        decoration: BoxDecoration(
                                          color: currentIndex == index
                                              ? Colors.white
                                              : Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              '₹ 20,000,00',
                              style: TextStyle(
                                fontFamily: regular,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: headingColor,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              '3 bds | 2 baths | 986 sqft - House for sale...',
                              style: TextStyle(
                                fontFamily: regular,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: headingColor,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  locationIc,
                                  height: 14.h,
                                  width: 14.w,
                                  color: focusedBrdColor,
                                ),
                                SizedBox(width: 6.w),
                                Expanded(
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    "A-17, Saket Vihar Colony Kalwar Road, Hathoj, Jaipur - 302012 (Opp Bank Of Baroda)",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: headingColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF0EB),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'Benefits For Your\n',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: regular,
                                  fontWeight: FontWeight.w500,
                                  color: headingColor,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Business',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500,
                                      color: textSpanColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          CustomButton(
                            buttonName: "Create Account ",
                            textColor: textSpanColor,
                            borderColor: textSpanColor,
                            backgroundColor: Color(0xFFFFE1E1),
                            onPressed: () {},
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 9.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFFEC554F).withAlpha(75),
                                    width: 1.w,
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        signupIc,
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                                      ShaderMask(
                                        shaderCallback: (bounds) =>
                                            LinearGradient(
                                          colors: const [
                                            Color(0xFFFF9F9F),
                                            Colors.white
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ).createShader(bounds),
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                            fontFamily: regular,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'Create\nAccount',
                                    style: TextStyle(
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: headingColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 9.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFFEC554F).withAlpha(75),
                                    width: 1.w,
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        businessListingIc,
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                                      ShaderMask(
                                        shaderCallback: (bounds) =>
                                            LinearGradient(
                                          colors: const [
                                            Color(0xFFFF9F9F),
                                            Colors.white
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ).createShader(bounds),
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            fontFamily: regular,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'List Your\nBusiness',
                                    style: TextStyle(
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: headingColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 9.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFFEC554F).withAlpha(75),
                                    width: 1.w,
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        leadsGenerateIc,
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                                      ShaderMask(
                                        shaderCallback: (bounds) =>
                                            LinearGradient(
                                          colors: const [
                                            Color(0xFFFF9F9F),
                                            Colors.white
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ).createShader(bounds),
                                        child: Text(
                                          '3',
                                          style: TextStyle(
                                            fontFamily: regular,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'Generate\nLeads',
                                    style: TextStyle(
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: headingColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'Real ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: regular,
                            fontWeight: FontWeight.w500,
                            color: headingColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Estate',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: regular,
                                fontWeight: FontWeight.w500,
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: secondaryFontColor,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 10,
                          color: secondaryFontColor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 250.h,
                  child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            margin: EdgeInsets.only(right: 10),
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: appBarBdrColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    CarouselSlider(
                                      carouselController:
                                          carouselSliderController,
                                      options: CarouselOptions(
                                        aspectRatio: 1 / .60,
                                        autoPlay: false,
                                        enlargeCenterPage: true,
                                        viewportFraction: 0.98,
                                        padEnds: false,
                                        pauseAutoPlayOnTouch: true,
                                        enableInfiniteScroll: false,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            currentIndex = index;
                                          });
                                        },
                                      ),
                                      items: List.generate(
                                        4,
                                        (index) => InkWell(
                                          onTap: () {},
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              width: 170.w,
                                              height: 100.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(0, 1),
                                                      blurRadius: 10,
                                                      spreadRadius: 0,
                                                      color: Colors.grey
                                                          .withAlpha(15))
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  businessImg,
                                                  height: 100,
                                                  width: 170.w,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.favorite_outline_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(4, (index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            width:
                                                currentIndex == index ? 12 : 8,
                                            height:
                                                currentIndex == index ? 12 : 8,
                                            decoration: BoxDecoration(
                                              color: currentIndex == index
                                                  ? Colors.white
                                                  : Colors.grey,
                                              shape: BoxShape.circle,
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  '₹ 20,000,00',
                                  style: TextStyle(
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: headingColor,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  '3 bds | 2 baths | 986 sqft - House for sale...',
                                  style: TextStyle(
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: headingColor,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      locationIc,
                                      height: 14.h,
                                      width: 14.w,
                                      color: focusedBrdColor,
                                    ),
                                    SizedBox(width: 6.w),
                                    Expanded(
                                      child: Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        "A-17, Saket Vihar Colony Kalwar Road, Hathoj, Jaipur - 302012 (Opp Bank Of Baroda)",
                                        style: TextStyle(
                                          fontFamily: regular,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: headingColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ));
                      }),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hospital',
                        style: TextStyle(
                          fontFamily: regular,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: headingColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: secondaryFontColor,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 10,
                          color: secondaryFontColor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 250.h,
                  child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            margin: EdgeInsets.only(right: 10),
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: appBarBdrColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    CarouselSlider(
                                      carouselController:
                                          carouselSliderController,
                                      options: CarouselOptions(
                                        aspectRatio: 1 / .60,
                                        autoPlay: false,
                                        enlargeCenterPage: true,
                                        viewportFraction: 0.98,
                                        padEnds: false,
                                        pauseAutoPlayOnTouch: true,
                                        enableInfiniteScroll: false,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            currentIndex = index;
                                          });
                                        },
                                      ),
                                      items: List.generate(
                                        4,
                                        (index) => InkWell(
                                          onTap: () {},
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              width: 170.w,
                                              height: 100.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(0, 1),
                                                      blurRadius: 10,
                                                      spreadRadius: 0,
                                                      color: Colors.grey
                                                          .withAlpha(15))
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  businessImg,
                                                  height: 100,
                                                  width: 170.w,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.favorite_outline_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(4, (index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            width:
                                                currentIndex == index ? 12 : 8,
                                            height:
                                                currentIndex == index ? 12 : 8,
                                            decoration: BoxDecoration(
                                              color: currentIndex == index
                                                  ? Colors.white
                                                  : Colors.grey,
                                              shape: BoxShape.circle,
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  '₹ 20,000,00',
                                  style: TextStyle(
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: headingColor,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  '3 bds | 2 baths | 986 sqft - House for sale...',
                                  style: TextStyle(
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: headingColor,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      locationIc,
                                      height: 14.h,
                                      width: 14.w,
                                      color: focusedBrdColor,
                                    ),
                                    SizedBox(width: 6.w),
                                    Expanded(
                                      child: Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        "A-17, Saket Vihar Colony Kalwar Road, Hathoj, Jaipur - 302012 (Opp Bank Of Baroda)",
                                        style: TextStyle(
                                          fontFamily: regular,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: headingColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ));
                      }),
                ),
                SizedBox(height: 16.h),
                Image.asset(
                  bannerImg2,
                  height: 130.h,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                    text: 'Best Deal ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: regular,
                      fontWeight: FontWeight.w500,
                      color: headingColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Offers ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w500,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                MediaQuery.removePadding(
                  context: context,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 2,
                      childAspectRatio: 0.95,
                    ),
                    shrinkWrap: true,
                    itemCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 160.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              gridItemImg,
                              height: 100,
                              width: 170.w,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              '₹ 20,000,00',
                              style: TextStyle(
                                fontFamily: regular,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: headingColor,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  locationIc,
                                  height: 14.h,
                                  width: 14.w,
                                  color: focusedBrdColor,
                                ),
                                SizedBox(width: 6.w),
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    "A-17, Saket Vihar Colony Kalwar Road",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: headingColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSearchDropdown({
    required String? value,
    required String hint,
    required ValueChanged<String?> onChanged,
  }) {
    List<String> items = [
      'United States',
      'Canada',
      'United Kingdom',
      'Australia',
      'India',
      'Germany',
      'France',
      'Japan',
      'China',
      'South Korea',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            buttonStyleData: ButtonStyleData(
              height: 55.h,
              width: 100.w,
              padding: const EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                color: appBarBdrColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.dm),
                  bottomLeft: Radius.circular(6.dm),
                ),
                border: Border(
                  right: BorderSide(
                    color: dividerColor,
                  ),
                ),
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                size: 20,
              ),
              iconSize: 14,
              iconEnabledColor: headingColor,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: MediaQuery.of(context).size.width * 0.45,
              useSafeArea: true,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: WidgetStateProperty.all(6),
                thumbVisibility: WidgetStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 48,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
            isDense: true,
            value: value,
            hint: Text(
              hint,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: secondaryFontColor,
                fontSize: 12,
              ),
            ),
            style: const TextStyle(
                color: Colors.white60,
                fontSize: 12,
                fontWeight: FontWeight.w400),
            isExpanded: true,
            items: items.map((String country) {
              return DropdownMenuItem<String>(
                value: country,
                child: Text(
                  country,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: regular,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
