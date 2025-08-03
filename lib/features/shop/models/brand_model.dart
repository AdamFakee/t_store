
import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  final String id;
  final String name;
  final String image;
  final bool isFeatured;
  final int productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured = false,
    this.productsCount = 0,
  });

  /// Empty model
  static BrandModel empty() => BrandModel(
    id: '',
    name: '',
    image: '',
  );

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Image": image,
      "IsFeatured": isFeatured,
      "ProductsCount": productsCount,
    };
  }

  /// Map JSON from Firebase to BrandModel
  factory BrandModel.fromJson(
    Map<String, dynamic> document,
  ) {
    final data = document;
    if(data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data["Id"] ?? "",
      name: data["Name"] ?? "",
      image: data["Image"] ?? "",
      isFeatured: data["IsFeatured"] ?? false,
      productsCount: data["ProductsCount"] ?? 0,
    );
  }


  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null) {
      final data = document.data()!;
      return BrandModel(
        id: document.id,
        name: data["Name"] ?? "",
        image: data["Image"] ?? "",
        isFeatured: data["IsFeatured"] ?? false,
        productsCount: data["ProductsCount"] ?? 0,
      );
    } else {
      return BrandModel.empty();
    }
  }
}