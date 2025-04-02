// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_search_bar.dart';
import 'package:deals_on_map/modules/dashboard/view/home/provider/home_provider.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_list/view/item_list.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:deals_on_map/service/api_url.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common_widgets/shimmer.dart';
import '../model/seller_offers_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider homeProvider;
  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeProvider.requestLocationPermission();
      homeProvider.homeApi(context);
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // context.read<HomeProvider>().getCurrentLocation();
    //   context.read<HomeProvider>().homeApi(context);
    // });
  }

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
        resizeToAvoidBottomInset: false,
        body: homeProvider.isLoading
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        children: [
                          SizedBox(height: 16.h),
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
                          Consumer<HomeProvider>(
                            builder: (context, homeProvider, child) {
                              int totalCategories =
                                  homeProvider.categoryList.length;
                              int itemCount = totalCategories > 8
                                  ? (homeProvider.isExpanded
                                      ? totalCategories
                                      : 8)
                                  : totalCategories;

                              return Column(
                                children: [
                                  GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 2.0,
                                      mainAxisSpacing: 2.0,
                                      childAspectRatio: 0.95,
                                    ),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: itemCount,
                                    itemBuilder: (context, index) {
                                      final item =
                                          homeProvider.categoryList[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ItemList(),
                                            ),
                                          );
                                        },
                                        child: businessCategoryCard(
                                          image: item.image,
                                          name: item.title,
                                        ),
                                      );
                                    },
                                  ),
                                  if (totalCategories > 8) SizedBox(height: 16),
                                  if (totalCategories > 8)
                                    CustomButton(
                                      buttonName: homeProvider.isExpanded
                                          ? "Show Less"
                                          : "View All",
                                      textColor: headingColor,
                                      onPressed: () =>
                                          homeProvider.toggleCategoryView(),
                                      backgroundColor: Colors.white,
                                      borderColor: brdColor,
                                    ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 16.h),
                          Consumer<HomeProvider>(
                            builder: (context, homeProvider, child) {
                              return CarouselSlider(
                                carouselController: carouselSliderController,
                                options: CarouselOptions(
                                  aspectRatio: 2 / .9,
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1.0,
                                  padEnds: false,
                                  pauseAutoPlayOnTouch: true,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) {},
                                ),
                                items: homeProvider.bannerList.isEmpty
                                    ? [
                                        CustomShimmer(
                                          width: double.infinity,
                                          height: 150.h,
                                          borderRadius: 15,
                                        )
                                      ]
                                    : homeProvider.bannerList.map((model) {
                                        return InkWell(
                                          onTap: () {},
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              '${ApiUrl.imageUrl}/${model.bannerImage}',
                                              height: 150.h,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Icon(
                                                    Icons.image_not_supported,
                                                    size: 150.h,
                                                    color: Colors.grey);
                                              },
                                            ),
                                          ),
                                        );
                                      }).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Consumer<HomeProvider>(
                      builder: (context, homeProvider, child) {
                        if (homeProvider.sellerCategoriesList.isEmpty) {
                          Log.console(
                              "1 :  ${homeProvider.sellerCategoriesList.length}");
                          return SizedBox.shrink();
                        }

                        final firstCategory =
                            homeProvider.sellerCategoriesList[0];
                        final firstSeller = firstCategory.sellers.isNotEmpty
                            ? firstCategory.sellers[0]
                            : null;

                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10),
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
                                        text: firstCategory.categoryName,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: regular,
                                          fontWeight: FontWeight.w500,
                                          color: headingColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ItemList(),
                                        ),
                                      );
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
                                          items: firstSeller!.videoPhotos
                                              .map(
                                                (videoPhoto) => InkWell(
                                                  onTap: () {},
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.20,
                                                      height: 200.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0, 1),
                                                            blurRadius: 10,
                                                            spreadRadius: 0,
                                                            color: Colors.grey
                                                                .withAlpha(15),
                                                          )
                                                        ],
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          videoPhoto.mediaUrl,
                                                          height: 200,
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: const Icon(
                                            Icons.favorite_outline_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 10,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: List.generate(
                                              firstSeller.videoPhotos.length,
                                              (index) {
                                                return Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 4),
                                                  width: currentIndex == index
                                                      ? 12
                                                      : 8,
                                                  height: currentIndex == index
                                                      ? 12
                                                      : 8,
                                                  decoration: BoxDecoration(
                                                    color: currentIndex == index
                                                        ? Colors.white
                                                        : Colors.grey,
                                                    shape: BoxShape.circle,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      firstSeller.businessName,
                                      style: TextStyle(
                                        fontFamily: regular,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: headingColor,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      firstCategory.categoryName,
                                      style: TextStyle(
                                        fontFamily: regular,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp,
                                        color: headingColor,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            firstSeller.address,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontFamily: regular,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp,
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
                        );
                      },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                        BorderRadius.circular(
                                                            15),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          offset: const Offset(
                                                              0, 1),
                                                          blurRadius: 10,
                                                          spreadRadius: 0,
                                                          color: Colors.grey
                                                              .withAlpha(15))
                                                    ],
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
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
                                                width: currentIndex == index
                                                    ? 12
                                                    : 8,
                                                height: currentIndex == index
                                                    ? 12
                                                    : 8,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                        BorderRadius.circular(
                                                            15),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          offset: const Offset(
                                                              0, 1),
                                                          blurRadius: 10,
                                                          spreadRadius: 0,
                                                          color: Colors.grey
                                                              .withAlpha(15))
                                                    ],
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
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
                                                width: currentIndex == index
                                                    ? 12
                                                    : 8,
                                                height: currentIndex == index
                                                    ? 12
                                                    : 8,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          Consumer<HomeProvider>(
                            builder: (context, homeProvider, child) {
                              List<SellerOfferModel> offerList =
                                  homeProvider.sellerOfferList.take(4).toList();
                              int itemCount = offerList.length;

                              return Column(
                                children: [
                                  GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: itemCount == 1
                                          ? 1
                                          : 2, // 1 item -> full width, otherwise 2 columns
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 2,
                                      childAspectRatio: 0.95,
                                    ),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: itemCount,
                                    itemBuilder: (context, index) {
                                      final offer = offerList[index];

                                      // Last item full width if total is 3
                                      bool isLastSingle =
                                          (itemCount == 3 && index == 2);

                                      return SizedBox(
                                        width: isLastSingle
                                            ? double.infinity
                                            : 160.w, // Last item full width
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              Uri.encodeFull(
                                                  '${ApiUrl.imageUrl}${offer.image}'), // Proper Encoding
                                              height: 100,
                                              width: 170.w,
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'assets/images/placeholder.png', // Default Image
                                                  height: 100,
                                                  width: 170.w,
                                                  fit: BoxFit.fill,
                                                );
                                              },
                                            ),
                                            SizedBox(height: 6.h),
                                            Text(
                                              offer.businessName,
                                              style: TextStyle(
                                                fontFamily: regular,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: headingColor,
                                              ),
                                            ),
                                            SizedBox(height: 6.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    offer.address,
                                                    style: TextStyle(
                                                      fontFamily: regular,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget businessCategoryCard({required String image, required String name}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
          decoration: BoxDecoration(
            color: appBarBdrColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network(
            '${ApiUrl.imageUrl}/$image',
            height: 32.h,
            width: 32.w,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          name,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'regular',
            color: Colors.black,
          ),
        ),
      ],
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
