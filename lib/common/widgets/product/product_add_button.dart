import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/products/cart_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductAddButton extends StatelessWidget {
  const TProductAddButton({
    super.key,
    this.borderRadius,
    this.backgroundColor = TColors.buttonPrimary,
    this.width = TSizes.iconLg * 1.2,
    this.height = TSizes.iconLg * 1.2,
    required this.product,
  });

  // customs addtributes
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final double width, height;

  // data
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return InkWell(
      // quantity > 0 => item already exits in cart => disable button
      onTap: () => cartController.getProductQuantityByProductId(product.id) > 0
          ? null
          : cartController.addItemToCart(product),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ??
              BorderRadius.only(
                topLeft: Radius.circular(TSizes.md),
                bottomRight: Radius.circular(TSizes.md),
              ),
          color: backgroundColor,
        ),

        // add icon or text quantity of product in cart
        child: SizedBox(
          height: height,
          width: width,
          child: cartController.getProductQuantityByProductId(product.id) > 0
              ? Center(
                  child: Text(
                      cartController
                          .getProductQuantityByProductId(product.id)
                          .toString(),
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
              )
              : Icon(Iconsax.add, color: TColors.white),
        ),
      ),
    );
  }
}
