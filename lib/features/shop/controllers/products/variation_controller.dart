import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/products/image_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class VariationController extends GetxController {
  static VariationController get instace => Get.find();

  // variales

  /// Contain selected attributes of product varation
  ///
  /// example: {color: Green, size: M, makeFrom: cotton}
  RxMap selectedAttributes = {}.obs;

  /// status of variation stock
  RxString variationStockStatus = "".obs;

  /// current variation
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// select attribute and variation
  void onAttributeSelected(
    ProductModel product,
    attributeName,
    attributeValue,
  ) {
    try {
      // when attribute is selected we will first add that attribute to the selectedAttribute

    /// in [selectedAttributes] dont assign immediately because both variables is ref to one storage which using contain variable value
    final selectedAttributes = Map<String, dynamic>.from(
      this.selectedAttributes,
    );
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    // show the selected variation image as a main image
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instace.selectedProductImage.value =
          selectedVariation.image;
    }

    // assign selected variation
    this.selectedVariation.value = selectedVariation;
    // update stoc status
    getProductVariationStockStatus();
    } catch (_) {
      selectedAttributes.value = {};
      TSnackBar.warningSnackBar(title: "Something wrong", message: "Pls, choose other option");
    }
  }

  bool _isSameAttributeValues(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttributes,
  ) {
    // If selectedAttributes contain 3 attributes and current variation contains 2 them return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // if any of the attributes is different then return. [Green, large] != [Green, small]
    for (final key in variationAttributes.keys) {
      // attributes[key] = value which could be [Green, small, cotton]...
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  /// check attribute availability / stock in varitaion
  Set<String?> getAttributesAvailabilityInVariation(
    List<ProductVariationModel> variations,
    String attributeName,
  ) {
    // pass the variations to check which attributes are available and stokc is not 0
    final availableVariationAttributeValues = variations
        .where(
          (variation) =>
              // check empty / out of stock attributes
              variation.attributeValues[attributeName] != null &&
              variation.attributeValues[attributeName]!.isNotEmpty &&
              variation.stock > 0,
        )
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

  /// check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0
        ? "In Stock"
        : "Out of Stock";
  }

  String getProductVariationPrice() {
    return selectedVariation.value.salePrice > 0 ? "\$${selectedVariation.value.salePrice}" : "\$${selectedVariation.value.price}";
  }

  /// reset selected attributes when switchiing products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = "";
    selectedVariation.value = ProductVariationModel.empty();
  }
}
