import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/texts/brand_icon_text.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/controllers/products/cart_controller.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/features/shop/screens/cart/widgets/product_text_rich.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    this.showAddButton = true,
    required this.cartItem, required this.cartItemIndex,
  });

  /// [showAddButton] control add & minus button that can be shown or not
  ///
  /// add & minus buttons can adjust num of products in cart
  final bool showAddButton;

  // data render variables
  final CartItemModel cartItem;

  /// using [cartItemIndex] to up perfomance when user spamly change [cartItem.quantity]. If have [cartItemIndex] => we dont need to loop all [cartItems].
  final int cartItemIndex;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: TSizes.md,
      children: [
        // image
        TRoundedImage(
          imageUrl: cartItem.image,
          isNeworkImage: true,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
        Expanded(
          flex: 4,
          child: Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --brand
              if(cartItem.brandName != null && cartItem.brandName!.isNotEmpty)
                TBrandIconText(title: cartItem.brandName!),
              
              // -- product name
              TProductTitleText(title: cartItem.title),

              // -- variant attributes
              if(cartItem.selectedVariation != null && cartItem.selectedVariation!.isNotEmpty)
                Wrap(
                  spacing: TSizes.sm,
                  children: cartItem.selectedVariation!.entries.map((attribute) {
                    return TProductTextRich(
                      prefixTitle: attribute.key,
                      title: attribute.value,
                    );
                  }).toList(),
                ),


              SizedBox(height: 5),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// --Adjust num of products
                  if (showAddButton)
                    Row(
                      spacing: TSizes.sm,
                      children: [
                        /// --Minus button
                        TCircularIcon(
                          iconColor: TColors.white,
                          icon: Iconsax.minus,
                          backroundColor: TColors.darkGrey.withOpacity(0.4),
                          height: 30,
                          width: 30,
                          onPressed: () {
                            cartController.changeProductQuantityInCart(productId: cartItem.productId, variantId: cartItem.variationId, isPlus: false, cartItemIndex: cartItemIndex);
                          },
                        ),

                        /// --NumOfProducts
                        Text(cartItem.quantity.toString()),

                        /// --Add button
                        TCircularIcon(
                          iconColor: TColors.white,
                          icon: Iconsax.add,
                          backroundColor: TColors.primary,
                          height: 30,
                          width: 30,
                          onPressed: () {
                            cartController.changeProductQuantityInCart(productId: cartItem.productId, variantId: cartItem.variationId, cartItemIndex: cartItemIndex);
                          },
                        ),
                      ],
                    ),

                  /// --Product price
                  TProductPriceText(
                    price: cartItem.price.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
