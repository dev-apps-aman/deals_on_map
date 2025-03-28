import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/modules/business/provider/shop_offer_provider.dart';
import 'package:deals_on_map/modules/business/views/business_offers/widget/shop_offer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopOffersListScreen extends StatefulWidget {
  const ShopOffersListScreen({super.key});

  @override
  State<ShopOffersListScreen> createState() => _ShopOffersListScreenState();
}

class _ShopOffersListScreenState extends State<ShopOffersListScreen> {
  late ShopOfferProvider shopOfferProvider;

  @override
  void initState() {
    super.initState();
    shopOfferProvider = context.read<ShopOfferProvider>();
    shopOfferProvider.shopOfferList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Shop Offers"),
      body: shopOfferProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : shopOfferProvider.offerList.isEmpty
              ? const Center(child: Text("No offers available"))
              : ListView.builder(
                  itemCount: shopOfferProvider.offerList.length,
                  itemBuilder: (context, index) {
                    return ShopOfferWidget(
                      imageUrl: shopOfferProvider.offerList[index].images[0],
                      offerDescription:
                          shopOfferProvider.offerList[index].description,
                      onDeletePost: () {
                        // shopOfferProvider.deleteShopOffer(
                        //   context,
                        //   shopOfferProvider.shopOffersList[index].id,
                        // );
                      },
                      onEditPost: () {
                        // shopOfferProvider.editShopOffer(
                        //   context,
                        //   shopOfferProvider.shopOffersList[index],
                        // );
                      },
                    );
                  },
                ),
    );
  }
}
