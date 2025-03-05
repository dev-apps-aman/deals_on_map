import 'dart:io';

import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';

import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar2.dart';
import 'package:deals_on_map/core/common_widgets/media_source_picker.dart';
import 'package:deals_on_map/core/image_util/image_picker_utils.dart';
import 'package:deals_on_map/main.dart';
import 'package:deals_on_map/modules/dashboard/view/profile/logout/view/logout.dart';
import 'package:deals_on_map/modules/dashboard/view/profile/provider/profile_provider.dart';
import 'package:deals_on_map/modules/dashboard/view/profile/view/delete/view/delete_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileProvider profileProvider;
  File image = File("");

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //profileProvider = context.read<AccountProvider>();
      //profileProvider.getProfileData(context);
    });
    super.initState();
  }

  final List<YourInfo> yourInfoItems = [
    YourInfo(
      image: shareIc,
      title: 'Share App',
      onTap: () {
        //Navigator.push(Constants.navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => const MyEarnings()));
      },
    ),
    YourInfo(
      image: rateIc,
      title: 'Rate Us',
      onTap: () {
        //Navigator.push(Constants.navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => const AboutUs()));
      },
    ),
    YourInfo(
      image: aboutIc,
      title: 'About Us',
      onTap: () {
        //Navigator.push(Constants.navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => const AboutUs()));
      },
    ),
    YourInfo(
      image: termsIc,
      title: 'Terms And Conditions',
      onTap: () {
        //Navigator.push(Constants.navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => const NotificationScreen()));
      },
    ),
    YourInfo(
      image: logoutIc,
      title: 'Logout',
      onTap: () {
        LogoutSheet.show(Constants.navigatorKey.currentContext!);
      },
    ),
    YourInfo(
      image: deleteIc,
      title: 'Delete Account',
      onTap: () {
        DeleteSheet.show(Constants.navigatorKey.currentContext!);
        //Navigator.push(Constants.navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => const NotificationScreen()));
      },
    ),
  ];

  final List<String> orders = List.generate(4, (index) => 'Order $index');
  final List<String> productImages = ['sellingIc', 'sellingIc', 'sellingIc'];

  bool isOnline = false;
  bool showAddProductScreen = false;
  bool showOnlineContent = true;

  void toggleStatus() {
    setState(() {
      isOnline = !isOnline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar2(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: appBarBdrColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
                          decoration: const BoxDecoration(
                            color: dividerColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            'My Account',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: headingColor,
                              fontFamily: regular,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                /*GestureDetector(
                                  onTap: () {
                                    onPickImage(context);
                                  },
                                  child: profileProvider.profileData != null && profileProvider.profileData!.profileImage!.isNotEmpty
                                      ? SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: DottedLineContainer(
                                      borderColor: AppColors.kGreen24,
                                      backgroundColor: AppColors.kWhite,
                                      borderRadius: 15.0,
                                      shape: CircleBorder(),
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          errorWidget: (context, url, error) => const Icon(
                                            Icons.photo_camera,
                                            color: AppColors.kGreen24,
                                          ),
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.fill,
                                          imageUrl: ApiUrl.imageUrl + profileProvider.profileData!.profileImage!.toString(),
                                          placeholder: (a, b) => const Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.kGreen24,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                      : image.path != ""
                                      ? ClipOval(
                                    child: Image.file(
                                      File(image.path),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                      : const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                ),*/
                                ClipOval(
                                  child: Image.asset(
                                    profileIcon,
                                    height: 78,
                                    width: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 5,
                                    child: Container(
                                        padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: textSpanColor,
                                        ),
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 14,
                                        )))
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User Name Here ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: medium,
                                      fontSize: 16.sp,
                                      color: headingColor,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '12345 67890',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: medium,
                                      fontSize: 14.sp,
                                      color: secondaryFontColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const EditProfile(),
                                    ),
                                  );*/
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: brdColor),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      size: 14,
                                      color: secondaryFontColor,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Edit',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: regular,
                                        fontSize: 10,
                                        color: secondaryFontColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36.h),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.separated(
                    itemCount: yourInfoItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: yourInfoItems[index].onTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          child: Row(
                            children: [
                              Image.asset(
                                yourInfoItems[index].image,
                                height: 36,
                                width: 36,
                              ),
                              SizedBox(width: 16.w),
                              Text(
                                yourInfoItems[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: medium,
                                  fontSize: 16.sp,
                                  color: headingColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20);
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

  void onPickImage(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (_) {
        return const MediaSourcePicker();
      },
    ).then((value) async {
      if (value != null && value is ImageSource) {
        File? pickedFile = await PickImageUtility.instance(
          applyEditor: true,
          context: context,
        ).pickedFile(value);
        if (pickedFile != null) {
          setState(() {
            image = pickedFile;
            // profileProvider.profileImage(context, image.path);
          });
        }
      }
    });
  }
}

class YourInfo {
  final String image;
  final String title;
  final VoidCallback onTap;

  YourInfo({
    required this.image,
    required this.title,
    required this.onTap,
  });
}

class OtherInfo {
  final String image;
  final String title;
  final VoidCallback onTap;

  OtherInfo({
    required this.image,
    required this.title,
    required this.onTap,
  });
}
