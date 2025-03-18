class BusinessCatModel {
  final dynamic id;
  final dynamic parentId;
  final dynamic title;
  final dynamic image;
  final dynamic slug;
  final dynamic isHome;
  final dynamic status;
  final dynamic createdAt;
  final dynamic updatedAt;

  BusinessCatModel({
    required this.id,
    required this.parentId,
    required this.title,
    required this.image,
    required this.slug,
    required this.isHome,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BusinessCatModel.fromJson(Map<String, dynamic> json) {
    return BusinessCatModel(
      id: json["id"] ?? 0,
      parentId: json["parent_id"] ?? 0,
      title: json["title"] ?? "",
      image: json["image"] ?? "",
      slug: json["slug"] ?? "",
      isHome: json["is_home"] ?? 0,
      status: json["status"] ?? "0",
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "parent_id": parentId,
      "title": title,
      "image": image,
      "slug": slug,
      "is_home": isHome,
      "status": status,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
