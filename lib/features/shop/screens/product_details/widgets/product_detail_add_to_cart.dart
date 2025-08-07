import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/features/shop/controllers/products/cart_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TProductDetailAddToCart extends StatelessWidget {
  const TProductDetailAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instace;

    return Container(
      padding: EdgeInsets.all(TSizes.md),
      height: TSizes.bottomNavigationHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.sm),
          topRight: Radius.circular(TSizes.sm),
        ),
        color: TColors.darkGrey.withOpacity(0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// --Add icon button
          Row(
            spacing: TSizes.sm,
            children: [
              /// --Minus button
              TCircularIcon(
                iconColor: TColors.white,
                icon: Iconsax.minus,
                backroundColor: TColors.darkGrey,
                height: 30,
                width: 30,
                onPressed: () {
                  cartController.changeNumOfProductAddToCart(isPlus: false);
                },
              ),

              /// --NumOfProducts
              Obx(
                () => Text(cartController.numOfProductAddToCart.string)
              ),

              /// --Add button
              TCircularIcon(
                iconColor: TColors.white,
                icon: Iconsax.add,
                backroundColor: TColors.black,
                height: 30,
                width: 30,
                onPressed: () {
                  cartController.changeNumOfProductAddToCart(isPlus: true);
                },
              ),
            ],
          ),

          /// --Add to cart button
          Obx(
            () => ElevatedButton(
              onPressed: cartController.numOfProductAddToCart.value > 0 
                ? () {
                  cartController.addItemToCart(product);
                }
                : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: cartController.numOfProductAddToCart.value > 0 ? TColors.black : TColors.buttonDisabled,
                side: BorderSide.none,
                padding: EdgeInsets.all(TSizes.md),
                textStyle: TextStyle(
                  fontSize: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child: Text(TTexts.addToCart, style: TextStyle(
                color: Colors.white
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
