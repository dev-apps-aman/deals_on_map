class BusinessDashboardModel {
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
  final String countryCode;
  final String offlineOnlineStatus;
  final String categoryName;
  final List<String> videoPhotos;
  final List<String> multipalServices;

  BusinessDashboardModel({
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
    required this.countryCode,
    required this.offlineOnlineStatus,
    required this.categoryName,
    required this.videoPhotos,
    required this.multipalServices,
  });

  factory BusinessDashboardModel.fromJson(Map<String, dynamic> json) {
    return BusinessDashboardModel(
      id: json['id'],
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
      countryCode: json['country_code'] ?? '',
      offlineOnlineStatus: json['offline_online_status'] ?? '',
      categoryName: json['category_name'] ?? '',
      videoPhotos: (json['video_photos'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      multipalServices: (json['multipal_services'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "business_owner_name": businessOwnerName,
      "business_name": businessName,
      "business_type": businessType,
      "website_link": websiteLink,
      "business_category_id": businessCategoryId,
      "gst_number": gstNumber,
      "country_id": countryId,
      "state_id": stateId,
      "city_id": cityId,
      "pan_card_number": panCardNumber,
      "address": address,
      "pincode": pincode,
      "seller_mobile": sellerMobile,
      "latitude": latitude,
      "longitude": longitude,
      "country_code": countryCode,
      "offline_online_status": offlineOnlineStatus,
      "category_name": categoryName,
      "video_photos": videoPhotos,
      "multipal_services": multipalServices,
    };
  }
}
