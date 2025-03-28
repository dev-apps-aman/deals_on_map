import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/pictures/view/pictures.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/reels/view/reels.dart';
import 'package:deals_on_map/modules/dashboard/view/home/view/item_detail/view/account/view/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../business/views/business_details/view/pictures/view/pictures.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Aamod Itsolution",
          widget: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 20.sp,
            ),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    /// **Header Section**
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F9F1),
                        border: Border(bottom: BorderSide(color: brdColor, width: 0.5)),
                      ),
                      child: Column(
                        children: [
                          /// **Business Info**
                          Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  profileIcon,
                                  height: 50.h,
                                  width: 50.w,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Aamod Itsolution',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: regular,
                                      color: headingColor,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      'IT support and services',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: regular,
                                        color: focusedBrdColor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              statusWidget(verifyIc, "Verified", headingColor),
                              statusWidget(offlineIc, "Offline", secondaryColor),
                              statusWidget(onlineIc, "Online", secondaryColor),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    labelColor: headingColor,
                    unselectedLabelColor: secondaryColor,
                    indicatorColor: headingColor,
                    tabs: [
                      Tab(text: 'Pictures'),
                      Tab(text: 'Reels'),
                      Tab(text: 'Account'),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              Pictures(),
              Reels(),
              Account(),
            ],
          ),
        ),
      ),
    );
  }

  /// **Status Widget (For Verified, Offline, Online)**
  Widget statusWidget(String icon, String text, Color color) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 20.h,
          width: 20.w,
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            fontFamily: regular,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}