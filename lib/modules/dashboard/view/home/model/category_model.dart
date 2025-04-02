class CategoryModel {
  final int id;
  final int parentId;
  final String title;
  final String image;
  final String slug;
  final bool isHome;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  CategoryModel({
    required this.id,
    required this.parentId,
    required this.title,
    required this.image,
    required this.slug,
    required this.isHome,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      parentId: json['parent_id'],
      title: json['title'],
      image: json['image'],
      slug: json['slug'],
      isHome: json['is_home'] == 1,
      status: json['status'].toString(),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.tryParse(json['deleted_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parent_id': parentId,
      'title': title,
      'image': image,
      'slug': slug,
      'is_home': isHome ? 1 : 0,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }
}
