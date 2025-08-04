import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/features/shop/controllers/products/favorite_product_controller.dart';

/// widget using for add & remove product into favorites (wishlist)
class TFavoriteButton extends StatelessWidget {
  const TFavoriteButton({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteProductController());

    return GestureDetector(
      onTap: () => controller.toogle(productId),
      child: Obx(() => TCircularIcon(
        iconColor: Colors.red,
        icon: controller.isExist(productId) ? Iconsax.heart5 : Iconsax.heart,
      ),)
    );
  }
}