class CartItemModel {
  final String productId;
  final String title;
  final double price;
  final String image;
  int quantity;
  final String variationId;
  final String? brandName;
  final Map<String, String>? selectedVariation; // {color: red, size: m}

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = '',
    this.image = '',
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.selectedVariation,
  });

  /// Empty cart item
  static CartItemModel empty() =>
      CartItemModel(productId: '', quantity: 0);

  /// Convert CartItemModel to JSON (for Firestore or API)
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }

  CartItemModel copyWith({
    int? quantity,
    String? productId,
    String? title,
    double? price,
    String? image,
    String? variationId,
    String? brandName,
    Map<String, String>? selectedVariation,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      variationId: variationId ?? this.variationId,
      brandName: brandName ?? this.brandName,
      selectedVariation: selectedVariation ?? this.selectedVariation,
    );
  }

  factory CartItemModel.fromJson(Map<String, dynamic> data) {
    return CartItemModel(
      productId: data["productId"] ?? "",
      title: data["title"] ?? "",
      price: (data["price"] ?? 0).toDouble(),
      image: data["image"] ?? "",
      quantity: data["quantity"] ?? 0,
      variationId: data["variationId"] ?? "",
      brandName: data["brandName"] ?? "",
      selectedVariation: Map<String, String>.from(data["selectedVariation"] ?? []),
    );
  }

  // /// Convert from Firestore snapshot
  // factory CartItemModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   final data = document.data();
  //   if (data != null) {
  //     return CartItemModel(
  //       productId: data['productId'] ?? '',
  //       title: data['title'] ?? '',
  //       price: (data['price'] ?? 0).toDouble(),
  //       image: data['image'] ?? '',
  //       quantity: data['quantity'] ?? 0,
  //       variationId: data['variationId'] ?? '',
  //       brandName: data['brandName'],
  //       selectedVariation: data['selectedVariation'] != null
  //           ? Map<String, String>.from(data['selectedVariation'])
  //           : null,
  //     );
  //   } else {
  //     return CartItemModel.empty();
  //   }
  // }
}
