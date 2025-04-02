class BannerModel {
  final String title;
  final String bannerImage;

  BannerModel({
    required this.title,
    required this.bannerImage,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      title: json['title'] ?? '',
      bannerImage: json['banner_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'banner_image': bannerImage,
    };
  }
}
