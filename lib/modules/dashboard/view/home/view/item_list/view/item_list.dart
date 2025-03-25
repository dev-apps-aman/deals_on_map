import 'package:carousel_slider/carousel_slider.dart';
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_search_bar.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/item_detail.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
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
        appBar: const CustomAppBar(title: "Real Estate"),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                child: CustomSearchBar(
                  hintText: "Search By...",
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
              ),
              SizedBox(height: 16.h),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ItemDetails()));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                      margin: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
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
                                        width:
                                            MediaQuery.of(context).size.width *
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
                              const Positioned(
                                top: 10,
                                right: 10,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
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
                  );
                },
              ),
            ],
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
