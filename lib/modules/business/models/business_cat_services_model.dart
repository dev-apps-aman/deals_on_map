class BusinessCatServicesModel {
  final int id;
  final String title;
  final String businessCategoryId;
  final String? slug;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  BusinessCatServicesModel({
    required this.id,
    required this.title,
    required this.businessCategoryId,
    this.slug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory BusinessCatServicesModel.fromJson(Map<String, dynamic> json) {
    return BusinessCatServicesModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      businessCategoryId: json["business_category_id"] ?? "",
      slug: json["slug"],
      status: json["status"] ?? "0",
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
      deletedAt: json["deleted_at"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "business_category_id": businessCategoryId,
      "slug": slug,
      "status": status,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "deleted_at": deletedAt,
    };
  }
}
