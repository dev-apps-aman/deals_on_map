import 'package:deals_on_map/constants/images.dart';
import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/modules/business/views/business_offers/widget/shop_offer_widget.dart';
import 'package:flutter/material.dart';

class ShopOffersListScreen extends StatelessWidget {
  const ShopOffersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Shop Offers"),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShopOfferWidget(
            imageUrl: offerImg,
            offerDescription:
                "Get amazing discounts on your favorite products. Limited time only!",
            onDeletePost: () {},
            onEditPost: () {},
          );
        },
      ),
    );
  }
}
