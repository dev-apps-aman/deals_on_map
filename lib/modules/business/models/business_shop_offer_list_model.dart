import 'package:deals_on_map/service/api_url.dart';

class ShopOfferModel {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OfferImageModel> images;

  ShopOfferModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory ShopOfferModel.fromJson(Map<String, dynamic> json) {
    return ShopOfferModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => OfferImageModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'images': images.map((img) => img.toJson()).toList(),
    };
  }
}

class OfferImageModel {
  final int id;
  final String image;

  OfferImageModel({required this.id, required this.image});

  factory OfferImageModel.fromJson(Map<String, dynamic> json) {
    return OfferImageModel(
      id: json['id'],
      image: ApiUrl.imageUrl + (json['image'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
    };
  }
}
