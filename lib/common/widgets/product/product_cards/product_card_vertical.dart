import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import 'package:t_store/features/shop/screens/product_details/product_details.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instace;
    final price = productController.getProductPrices(product);
    final salePercentage = productController.getDiscoutPercent(product.price, product.salePrice);
    final isDarkMode = THelperFunctions.isDarkMode(context);
    
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails(product: product,));
      },
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.md),
          color: isDarkMode ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          spacing: TSizes.sm,
          children: [
            // thumbnail image & favorite button & sale tag
            TCircularContainer(
              width: double.infinity,
              radius: TSizes.md,
              height: 180,
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
                    child: TProductSaleTag(title: "$salePercentage"),
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
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // product title
                  TProductTitleText(title: product.title),
                  // brand
                  if(product.brand?.name != null) 
                     TBrandIconText(title: product.brand!.name),
                ],
              ),
            ),

            const Spacer(),
            // price & button add
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      if(salePercentage != null) 
                        Text(product.price.toString(), style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough, color: Colors.grey)),
                      TProductPriceText(price: price, curencySign: "",),
                    ],
                  ),
                  TProductAddButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
