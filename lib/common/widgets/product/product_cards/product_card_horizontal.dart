import 'package:flutter/material.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/product/favorite_button/favorite_button.dart';
import 'package:t_store/common/widgets/product/product_add_button.dart';
import 'package:t_store/common/widgets/product/product_sale_tag.dart';
import 'package:t_store/common/widgets/texts/brand_icon_text.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/controllers/products/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instace;
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 120,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.md),
          color: isDarkMode ? TColors.darkGrey : TColors.white,
        ),
        child: Row(
          spacing: TSizes.sm,
          children: [
            // thumbnail image & favorite button & sale tag
            TCircularContainer(
              height: double.infinity,
              radius: TSizes.md,
              width: 180,
              backgroundColor: isDarkMode ? TColors.dark : TColors.light,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  TRoundedImage(
                    width: double.infinity,
                    height: double.infinity,
                    imageUrl: product.thumbnail,
                    isNeworkImage: true,
                    fit: BoxFit.cover,
                  ),
                  // sale tag
                  Positioned(
                    top: 15,
                    left: 5,
                    child: TProductSaleTag(title: '20')
                  ),
                  // heart button
                  Positioned(
                    top: 10,
                    right: 5,
                    child: TFavoriteButton(productId: product.id),
                  ),
                ],
              ),
            ),

            // product detail
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // product title and brand
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: TSizes.sm,
                      children: [
                        TProductTitleText(title: product.title),
                        // brand
                        TBrandIconText(title: product.brand?.name ?? "",),
                      ],
                    ),

                    // Spacer để đẩy price & button add xuống dưới cùng
                    // Spacer chiếm diện tích còn lại
                    Spacer(),

                    // price & button add 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // price
                        TProductPriceText(price: controller.getProductPrices(product), curencySign: "",),
                        // add button
                        TProductAddButton(product: product,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
