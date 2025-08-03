import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  final String brandName;
  final String categoryId;

  BrandCategoryModel({required this.brandName, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {
      "BrandName": brandName,
      "CategoryId": categoryId
    };
  }

  factory BrandCategoryModel.fromSnapshot (DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return BrandCategoryModel(brandName: data['BrandName'], categoryId: data["CategoryId"]);
  }
}