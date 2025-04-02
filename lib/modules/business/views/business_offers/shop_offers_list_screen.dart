import 'package:deals_on_map/core/common_widgets/custom_app_bar.dart';
import 'package:deals_on_map/modules/business/provider/shop_offer_provider.dart';
import 'package:deals_on_map/modules/business/views/business_offers/create_update_shop_offer.dart';
import 'package:deals_on_map/modules/business/views/business_offers/widget/shop_offer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopOffersListScreen extends StatefulWidget {
  const ShopOffersListScreen({super.key});

  @override
  State<ShopOffersListScreen> createState() => _ShopOffersListScreenState();
}

class _ShopOffersListScreenState extends State<ShopOffersListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ShopOfferProvider>().shopOfferList(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Shop Offers"),
      body: Consumer<ShopOfferProvider>(
        builder: (context, shopOfferProvider, child) {
          if (shopOfferProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (shopOfferProvider.offerList.isEmpty) {
            return const Center(child: Text("No offers available"));
          } else {
            return RefreshIndicator(
              onRefresh: () => shopOfferProvider.shopOfferList(context),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: shopOfferProvider.offerList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var offer = shopOfferProvider.offerList[index];
                  String imageUrl = offer.images.isNotEmpty
                      ? offer.images.first.image
                      : 'assets/images/placeholder.png';

                  return ShopOfferWidget(
                    imageUrl: imageUrl,
                    offerDescription: offer.description,
                    onDeletePost: () {
                      shopOfferProvider.onDeleteShopOffer(context, offer.id);
                    },
                    onEditPost: () {
                      shopOfferProvider.setEditOffer(offer);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateOrUpdateShopOffer(
                            isEditMode: true,
                            offerId: offer.id,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
