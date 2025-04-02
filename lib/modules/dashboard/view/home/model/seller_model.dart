class SellerCategoryModel {
  final int categoryId;
  final String categoryName;
  final List<SellerModel> sellers;

  SellerCategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.sellers,
  });

  factory SellerCategoryModel.fromJson(Map<String, dynamic> json) {
    return SellerCategoryModel(
      categoryId: json['category_id'] ?? 0,
      categoryName: json['category_name'] ?? '',
      sellers: (json['sellers'] as List?)
              ?.map((e) => SellerModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'sellers': sellers.map((e) => e.toJson()).toList(),
    };
  }
}

class SellerModel {
  final int id;
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
  final String categoryName;
  final List<VideoPhotoModel> videoPhotos;
  final List<MultipleServiceModel> multipleServices;

  SellerModel({
    required this.id,
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
    required this.categoryName,
    required this.videoPhotos,
    required this.multipleServices,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
      id: json['id'] ?? 0,
      businessOwnerName: json['business_owner_name'] ?? '',
      businessName: json['business_name'] ?? '',
      businessType: json['business_type'] ?? '',
      websiteLink: json['website_link'] ?? '',
      businessCategoryId: json['business_category_id'] ?? 0,
      gstNumber: json['gst_number'] ?? '',
      countryId: json['country_id'].toString(),
      stateId: json['state_id'].toString(),
      cityId: json['city_id'].toString(),
      panCardNumber: json['pan_card_number'] ?? '',
      address: json['address'] ?? '',
      pincode: json['pincode'] ?? '',
      sellerMobile: json['seller_mobile'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      categoryName: json['category_name'] ?? '',
      videoPhotos: (json['video_photos'] as List?)
              ?.map((e) => VideoPhotoModel.fromJson(e))
              .toList() ??
          [],
      multipleServices: (json['multipal_services'] as List?)
              ?.map((e) => MultipleServiceModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'business_owner_name': businessOwnerName,
      'business_name': businessName,
      'business_type': businessType,
      'website_link': websiteLink,
      'business_category_id': businessCategoryId,
      'gst_number': gstNumber,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
      'pan_card_number': panCardNumber,
      'address': address,
      'pincode': pincode,
      'seller_mobile': sellerMobile,
      'latitude': latitude,
      'longitude': longitude,
      'category_name': categoryName,
      'video_photos': videoPhotos.map((e) => e.toJson()).toList(),
      'multipal_services': multipleServices.map((e) => e.toJson()).toList(),
    };
  }
}

class VideoPhotoModel {
  final String mediaUrl;
  final String mediaType;

  VideoPhotoModel({
    required this.mediaUrl,
    required this.mediaType,
  });

  factory VideoPhotoModel.fromJson(Map<String, dynamic> json) {
    return VideoPhotoModel(
      mediaUrl: json['path'] ?? '',
      mediaType: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': mediaUrl,
      'type': mediaType,
    };
  }
}

class MultipleServiceModel {
  final int serviceId;
  final String serviceName;
  final double price;

  MultipleServiceModel({
    required this.serviceId,
    required this.serviceName,
    required this.price,
  });

  factory MultipleServiceModel.fromJson(Map<String, dynamic> json) {
    return MultipleServiceModel(
      serviceId: json['service_id'] ?? 0,
      serviceName: json['service_title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service_id': serviceId,
      'service_title': serviceName,
      'price': price,
    };
  }
}
