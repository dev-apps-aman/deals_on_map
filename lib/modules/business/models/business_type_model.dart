class BusinessTypeModel {
  final String title;
  final String description;
  final String imagePath;
  final String apiValue;

  BusinessTypeModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.apiValue,
  });

  factory BusinessTypeModel.fromJson(Map<String, dynamic> json) {
    return BusinessTypeModel(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      imagePath: json["imagePath"] ?? "",
      apiValue: json["apiValue"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "imagePath": imagePath,
      "apiValue": apiValue,
    };
  }
}
