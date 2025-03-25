import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyEnquiryScreen extends StatelessWidget {
  const MyEnquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Shop Offers"),
    );
  }
}
