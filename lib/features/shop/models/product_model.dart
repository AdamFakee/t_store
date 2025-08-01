import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/product_attributes_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';

class ProductModel {
  final String id;
  final int stock;
  final String? sku;
  final double price;
  final String title;
  final DateTime? date;
  final double salePrice;
  final String thumbnail;
  final bool isFeatured;
  final BrandModel? brand;
  final String? description;
  final String? categoryId;
  final List<String>? images;
  final String productType;
  final List<ProductAttributeModel>? productAttributes;
  final List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured = false,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  /// Empty model
  static ProductModel empty() => ProductModel(
    id: '',
    stock: 0,
    price: 0.0,
    title: '',
    salePrice: 0.0,
    thumbnail: '',
    productType: "",
  );

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      "Stock": stock,
      "SKU": sku,
      "Price": price,
      "Title": title,
      "Date": date?.toIso8601String(),
      "SalePrice": salePrice,
      "Thumbnail": thumbnail,
      "IsFeatured": isFeatured,
      "Brand": brand?.toJson(),
      "Description": description,
      "CategoryId": categoryId,
      "Images": images,
      "ProductType": productType,
      "ProductAttributes": productAttributes != null ? productAttributes?.map((e) => e.toJson()).toList() : [],
      "ProductVariations": productVariations != null ? productVariations?.map((e) => e.toJson()).toList() : [],
    };
  }

  /// Map JSON from Firebase to ProductModel
  factory ProductModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return ProductModel(
        id: document.id,
        stock: data["Stock"] ?? 0,
        sku: data["SKU"],
        price: data["Price"] ?? 0.0,
        title: data["Title"] ?? "",
        date: data["Date"] != null ? DateTime.parse(data["Date"]) : null,
        salePrice: data["SalePrice"] ?? 0.0,
        thumbnail: data["Thumbnail"] ?? "",
        isFeatured: data["IsFeatured"] ?? false,
        brand: data["Brand"] != null ? BrandModel.fromJson(data["Brand"]) : null,
        description: data["Description"],
        categoryId: data["CategoryId"],
        images: List<String>.from(data["Images"] ?? []),
        productType: data["ProductType"] ?? "",
        productAttributes: List<ProductAttributeModel>.from(
          data["ProductAttributes"]?.map(
            (attr) => ProductAttributeModel.fromJson(attr),
          ) ?? [],
        ),
        productVariations: List<ProductVariationModel>.from(
          data["ProductVariations"]?.map(
            (e) => ProductVariationModel.fromJson(e),
          ) ?? [],
        ),
      );
    } else {
      return ProductModel.empty();
    }
  }
}