import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final bool isFeatured;
  final String parentId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  /// return empty model
  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false);

  /// convert model data to JSON data structure
  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Image": image,
      "IsFeatured": isFeatured,
      "ParentId": parentId,
    };
  }

  /// Map Json oriented documents from firebase to CategoryModel
  factory CategoryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> documents,
  ) {
    if (documents.data() != null) {
      final data = documents.data()!;
      return CategoryModel(
        id: documents.id,
        name: data["Name"] ?? "",
        image: data['Image'] ?? "",
        isFeatured: data["IsFeatured"] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
