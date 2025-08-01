
class ProductAttributeModel {
  final String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  /// Empty model
  static ProductAttributeModel empty() => ProductAttributeModel();

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Values": values,
    };
  }

  /// Map json from Firebase to Model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> data) {
    return ProductAttributeModel(
      name: data["Name"],
      values: List<String>.from(data["Values"] ?? []),
    );
  }
}