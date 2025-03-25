import 'dart:io';
import 'package:deals_on_map/modules/business/provider/shop_offer_provider.dart';
import 'package:deals_on_map/modules/business/views/business_offers/widget/dotted_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';


  

class CreateShopOffer extends StatelessWidget {
  const CreateShopOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: "Create Shop Offers"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              
              Text(
                'Upload Offer Banners',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: regular,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Let Your Business Shine with Stunning Images',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  fontFamily: regular,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 16.h),

           
              Consumer<ShopOfferProvider>(
                builder: (context, provider, child) {
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [                     
                      ...List.generate(provider.selectedImages.length, (index) {
                        return Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image:
                                      FileImage(provider.selectedImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: GestureDetector(
                                onTap: () => provider.removeImage(index),
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withAlpha(125),
                                  ),
                                  child: Icon(Icons.close,
                                      color: Colors.white, size: 18),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),

                      GestureDetector(
                        onTap: () => showImagePicker(context, provider),
                        child: CustomPaint(
                          painter: DottedBorderPainter(
                              radius: 10, borderColor: Color(0xFF8BB598)),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFFAFFF8),
                            ),
                            child: Center(
                              child:
                                  Icon(Icons.add, size: 30, color: mainColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              SizedBox(height: 16.h),

              Text(
                'Title',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: regular,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              CustomTextField(
                borderRadius: 10,
                fillColor: Colors.transparent,
                borderCl: unselectedFontColor,
                hintText: "Enter Title",
              ),

              SizedBox(height: 23.h),

              Text(
                'Offer Description',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: regular,
                  color: headingColor,
                ),
              ),
              SizedBox(height: 6.h),
              CustomTextField(
                borderRadius: 10,
                fillColor: Colors.transparent,
                borderCl: unselectedFontColor,
                hintText: "Enter Description",
                maxCheck: 8,
                minCheck: 5,
                textInputAction: TextInputAction.newline,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: greeenCFBB))),
        child: CustomButton(buttonName: "Save", onPressed: () {}),
      ),
    );
  }

  Future<void> showImagePicker(
      BuildContext context, ShopOfferProvider provider) async {
    final ImagePicker picker = ImagePicker();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () async {
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  provider.addImage(File(image.path));
                }
                Navigator.pop(context);
              },
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
            ),
            ListTile(
              onTap: () async {
                final List<XFile> images = await picker.pickMultiImage();
                if (images.isNotEmpty) {
                  for (var img in images) {
                    provider.addImage(File(img.path));
                  }
                }
                Navigator.pop(context);
              },
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
