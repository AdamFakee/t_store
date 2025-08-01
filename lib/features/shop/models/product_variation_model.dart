
class ProductVariationModel {
  final String id;
  final String sku;
  final String image;
  final String? description;
  final double price;
  final double salePrice;
  final int stock;
  final Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Empty model
  static ProductVariationModel empty() => ProductVariationModel(
    id: '',
    attributeValues: {},
  );

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "SKU": sku,
      "Image": image,
      "Description": description,
      "Price": price,
      "SalePrice": salePrice,
      "Stock": stock,
      "AttributeValues": attributeValues,
    };
  }

  /// Map JSON from Firebase to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> data) {
    return ProductVariationModel(
      id: data["Id"] ?? '',
      sku: data["SKU"] ?? '',
      image: data["Image"] ?? '',
      description: data["Description"],
      price: data["Price"] ?? 0.0,
      salePrice: data["SalePrice"] ?? 0.0,
      stock: data["Stock"] ?? 0,
      attributeValues: Map<String, String>.from(data["AttributeValues"] ?? {}),
    );
  }
}