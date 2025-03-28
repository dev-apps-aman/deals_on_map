import 'dart:io';
import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/modules/business/provider/shop_offer_provider.dart';
import 'package:deals_on_map/modules/business/views/business_offers/widget/dotted_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';
import 'package:video_player/video_player.dart';

class CreateShopOffer extends StatelessWidget {
  const CreateShopOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        File file = provider.selectedImages[index];
                        String extension = file.path.split('.').last.toLowerCase();
                        bool isVideo = ["mp4", "mov", "avi"].contains(extension);

                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: isVideo
                                  ? GestureDetector(
                                onTap: () {
                                  _playVideo(context, file);
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.black,
                                  child: Center(
                                    child: Icon(Icons.play_circle_fill,
                                        size: 40, color: Colors.white),
                                  ),
                                ),
                              )
                                  : Image.file(file,
                                  width: 100, height: 100, fit: BoxFit.cover),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () => provider.removeImage(index),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 12,
                                  child: Icon(Icons.close, size: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                      if (provider.selectedImages.length < 5)
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
                                child: Icon(Icons.add, size: 30, color: mainColor),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),              SizedBox(height: 16.h),
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
                controller: context.read<ShopOfferProvider>().titleController,
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
                controller: context.read<ShopOfferProvider>().descController,
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: greeenCFBB))),
        child: CustomButton(
            buttonName: "Save",
            onPressed: () {
              context.read<ShopOfferProvider>().onCreateShopOffer(context);
            }),
      ),
    );
  }

  Future<void> showImagePicker(
      BuildContext context, ShopOfferProvider provider) async {
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
                if (provider.selectedImages.length >= 5) {
                  errorToast(context, "You can select a maximum of 5 files");
                  return;
                }

                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png'],
                  allowMultiple: false,
                );

                if (result != null && result.files.isNotEmpty) {
                  provider.addImage(File(result.files.first.path!));
                }
                Navigator.pop(context);
              },
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
            ),


            ListTile(
              onTap: () async {
                int remainingSlots = 5 - provider.selectedImages.length;
                if (remainingSlots <= 0) {
                  errorToast(context, "You can select a maximum of 5 files");
                  return;
                }

                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'jpeg', 'mp4', 'mov', 'avi'],
                  allowMultiple: true,
                );

                if (result != null && result.files.isNotEmpty) {
                  int addedCount = 0;

                  for (var file in result.files) {
                    if (addedCount >= remainingSlots) break;
                    provider.addImage(File(file.path!));
                    addedCount++;
                  }

                  if (addedCount == 0) {
                    errorToast(context, "No files added.");
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
  void _playVideo(BuildContext context, File file) {
    VideoPlayerController _controller = VideoPlayerController.file(file);

    _controller.initialize().then((_) {
      _controller.play();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _controller.pause();
                _controller.dispose();
                Navigator.pop(context);
              },
              child: Text("Close"),
            ),
          ],
        ),
      ).then((_) {
        _controller.dispose();
      });
    }).catchError((error) {
      print("Video Error: $error");
    });
  }


}
