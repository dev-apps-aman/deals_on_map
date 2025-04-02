class SellerOfferModel {
  final int id;
  final int sellerId;
  final String title;
  final String image;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String businessOwnerName;
  final String businessName;
  final String businessType;
  final String websiteLink;
  final int businessCategoryId;
  final String gstNumber;
  final String countryId;
  final String stateId;
  final String cityId;
  final String panCardNumber;
  final String address;
  final String pincode;
  final String sellerMobile;
  final String latitude;
  final String longitude;

  SellerOfferModel({
    required this.id,
    required this.sellerId,
    required this.title,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.businessOwnerName,
    required this.businessName,
    required this.businessType,
    required this.websiteLink,
    required this.businessCategoryId,
    required this.gstNumber,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.panCardNumber,
    required this.address,
    required this.pincode,
    required this.sellerMobile,
    required this.latitude,
    required this.longitude,
  });

  factory SellerOfferModel.fromJson(Map<String, dynamic> json) {
    return SellerOfferModel(
      id: json['id'] ?? 0,
      sellerId: json['seller_id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      businessOwnerName: json['business_owner_name'] ?? '',
      businessName: json['business_name'] ?? '',
      businessType: json['business_type'] ?? '',
      websiteLink: json['website_link'] ?? '',
      businessCategoryId: json['business_category_id'] ?? 0,
      gstNumber: json['gst_number'] ?? '',
      countryId: json['country_id'] ?? '',
      stateId: json['state_id'] ?? '',
      cityId: json['city_id'] ?? '',
      panCardNumber: json['pan_card_number'] ?? '',
      address: json['address'] ?? '',
      pincode: json['pincode'] ?? '',
      sellerMobile: json['seller_mobile'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
    );
  }
}
