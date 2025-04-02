import 'dart:io';
import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/modules/business/provider/shop_offer_provider.dart';
import 'package:deals_on_map/modules/business/views/business_offers/widget/dotted_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';
import 'package:file_picker/file_picker.dart';

class CreateOrUpdateShopOffer extends StatefulWidget {
  final bool isEditMode;
  final int? offerId;

  const CreateOrUpdateShopOffer({
    super.key,
    this.isEditMode = false,
    this.offerId,
  });

  @override
  State<CreateOrUpdateShopOffer> createState() =>
      _CreateOrUpdateShopOfferState();
}

class _CreateOrUpdateShopOfferState extends State<CreateOrUpdateShopOffer> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ShopOfferProvider>(context, listen: false);

    if (!widget.isEditMode) {
      provider.resetData();
      provider.existingImages.clear();
      provider.selectedImages.clear();
      provider.titleController.clear();
      provider.descController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShopOfferProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(
          title: widget.isEditMode ? "Update Shop Offer" : "Create Shop Offer"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text('Upload Offer Banners', style: _headingStyle()),
              const SizedBox(height: 6),
              Text('Let Your Business Shine with Stunning Images',
                  style: _subHeadingStyle()),
              const SizedBox(height: 16),
              Consumer<ShopOfferProvider>(
                builder: (context, provider, child) {
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...List.generate(provider.existingImages.length, (index) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                provider.existingImages[index].image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () => provider.removeExistingImage(
                                  index,
                                  provider.existingImages[index].id,
                                  widget.isEditMode,
                                  context,
                                ),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 12,
                                  child: Icon(Icons.close,
                                      size: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),

                      // Show Newly Selected Images (from Device)
                      ...List.generate(provider.selectedImages.length, (index) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                provider.selectedImages[index],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () => provider.removeImage(
                                    index, widget.isEditMode, context),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 12,
                                  child: Icon(Icons.close,
                                      size: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),

                      // Image Picker Button
                      if (provider.selectedImages.length +
                              provider.existingImages.length <
                          5)
                        GestureDetector(
                          onTap: () => showImagePicker(context, provider),
                          child: CustomPaint(
                            painter: DottedBorderPainter(
                              radius: 10,
                              borderColor: const Color(0xFF8BB598),
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFFAFFF8),
                              ),
                              child: const Center(
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
              const SizedBox(height: 16),
              Text('Title', style: _headingStyle()),
              const SizedBox(height: 6),
              CustomTextField(
                controller: provider.titleController,
                borderRadius: 10,
                fillColor: Colors.transparent,
                borderCl: unselectedFontColor,
                hintText: "Enter Title",
              ),
              const SizedBox(height: 23),
              Text('Offer Description', style: _headingStyle()),
              const SizedBox(height: 6),
              CustomTextField(
                controller: provider.descController,
                borderRadius: 10,
                fillColor: Colors.transparent,
                borderCl: unselectedFontColor,
                hintText: "Enter Description",
                maxCheck: 8,
                minCheck: 5,
                txKeyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: greeenCFBB)),
        ),
        child: CustomButton(
          buttonName: widget.isEditMode ? "Update" : "Save",
          onPressed: () {
            if (widget.isEditMode && widget.offerId != null) {
              provider.onUpdateShopOffer(context, widget.offerId!);
            } else {
              provider.onCreateShopOffer(context);
            }
          },
        ),
      ),
    );
  }

  Future<void> showImagePicker(
      BuildContext context, ShopOfferProvider provider) async {
    if (provider.selectedImages.length >= 5) {
      errorToast(context, "You can select a maximum of 5 images");
      return;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      int addedCount = 0;
      int remainingSlots =
          5 - (provider.selectedImages.length + provider.existingImages.length);

      for (var file in result.files) {
        if (addedCount >= remainingSlots) break;
        provider.addImage(File(file.path!));
        addedCount++;
      }

      if (addedCount == 0) {
        errorToast(context, "No images added.");
      }
    }
  }

  TextStyle _headingStyle() => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: regular,
        color: headingColor,
      );

  TextStyle _subHeadingStyle() => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        fontFamily: regular,
        color: secondaryColor,
      );
}
