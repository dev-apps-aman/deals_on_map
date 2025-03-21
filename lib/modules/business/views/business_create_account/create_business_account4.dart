import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:deals_on_map/core/common_widgets/custom_dropdown1.dart';
import 'package:deals_on_map/core/common_widgets/custom_input_fields.dart';
import 'package:deals_on_map/core/common_widgets/multi_select_dropdown.dart';
import 'package:deals_on_map/modules/business/models/business_cat_model.dart';
import 'package:deals_on_map/modules/business/models/business_cat_services_model.dart';
import 'package:deals_on_map/modules/business/provider/business_provider.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateBusinessAccount4 extends StatefulWidget {
  const CreateBusinessAccount4({super.key});

  @override
  State<CreateBusinessAccount4> createState() => CreateBusinessAccount4State();
}

class CreateBusinessAccount4State extends State<CreateBusinessAccount4> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BusinessProvider>(context, listen: false)
          .fetchBusinessCategories(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Create Account"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'Enter A Business Category',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: medium,
                    color: headingColor,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Help customers discover your business by industry by adding a business category',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: regular,
                    color: secondaryFontColor,
                  ),
                ),
                SizedBox(height: 22.h),
                Consumer<BusinessProvider>(
                  builder: (context, businessProvider, child) {
                    return CustomDropdown1<BusinessCatModel>(
                      hint: "Business Category",
                      isLoading: businessProvider.isLoading,
                      items: businessProvider.businessCatList,
                      value: businessProvider.selectedBusinessCat,
                      itemLabel: (item) => item.title,
                      onChanged: (BusinessCatModel? value) {
                        businessProvider.onBusinessCategoryChange(
                            context, value!);
                      },
                    );
                  },
                ),
                SizedBox(height: 30.h),
                Consumer<BusinessProvider>(
                  builder: (context, businessProvider, _) {
                    return MultiSelectDropdown<BusinessCatServicesModel>(
                      hint: "Select Service",
                      itemLabel: (item) => item.title,
                      items: businessProvider.businessCatServicesList,
                      selectedItems:
                          businessProvider.selectedBusinessCatServices,
                      onItemToggle: (item) {
                        businessProvider.toggleSelection(item);
                      },
                    );
                  },
                ),
                SizedBox(height: 30.h),
                Consumer<BusinessProvider>(
                  builder: (context, businessProvider, child) {
                    return CustomTextField(
                      controller: businessProvider.gstController,
                      borderRadius: 10,
                      fillColor: Colors.white,
                      borderCl: brdColor,
                      hintText: "GST Number",
                      leading1: Image.asset(
                        shopBegIc,
                        height: 20.h,
                        width: 20.w,
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h),
                Consumer<BusinessProvider>(
                  builder: (context, businessProvider, child) {
                    return CustomTextField(
                      controller: businessProvider.panController,
                      borderRadius: 10,
                      fillColor: Colors.white,
                      borderCl: brdColor,
                      hintText: "PAN Card Number",
                      leading1: Image.asset(
                        idIc,
                        height: 20.h,
                        width: 20.w,
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h),
                CustomButton(
                    buttonName: "Continue",
                    onPressed: () {
                      context.read<BusinessProvider>().onBussCatSubmit(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
