import 'package:carousel_slider/carousel_slider.dart';
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar2.dart';
import 'package:deals_on_map/core/common_widgets/custom_search_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(mapImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20.h,
              left: 15.w,
              right: 15.w,
              child: CustomSearchBar(
                borderRadius: BorderRadius.circular(6.dm),
                color: Colors.white,
                hintText: "Search By...",
                leading1: Padding(
                  padding: const EdgeInsets.only(right: 10),
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
                  decoration: const BoxDecoration(
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, -2),
                          blurRadius: 10,
                          spreadRadius: 0,
                          color: Colors.grey.withAlpha(25))
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Near By Stores',
                              style: TextStyle(
                                fontFamily: medium,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: headingColor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showMapBottomSheet(context);
                            },
                            child: Row(
                              children: [
                                Text(
                                  'View All',
                                  style: TextStyle(
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: headingColor,
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16.sp,
                                  color: focusedBrdColor,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15.h),
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
                              margin: const EdgeInsets.only(right: 10),
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
                                      const Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Row(
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
                                                  horizontal: 4.w),
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
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
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
                border: const Border(
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

  void showMapBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.dm)),
                color: appBarBdrColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Category',
                    style: TextStyle(
                      fontFamily: medium,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: headingColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel,
                      size: 20.sp,
                      color: secondaryFontColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
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
          ],
        );
      },
    );
  }
}
