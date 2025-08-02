import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instace => Get.find();

  // variables
  RxString selectedProductImage = "".obs;

  /// Get all images from product and variations
  List<String> getAllProductImages(ProductModel product) {
    // User set to add unique iamges only
    Set<String> images = {};

    selectedProductImage.value = product.thumbnail;

    // mặc định thumbnail sẽ = product.image[0] nên không cần lấy thumbnail
    // get all image in product.image
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // get all images in variation
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
        product.productVariations!.map((variation) => variation.image),
      );
    }

    return images.toList();
  }

  /// view image with larger view
  void showImagePopup(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: TSizes.defaultSpace * 2,
                horizontal: TSizes.defaultSpace,
              ),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text("Close"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
