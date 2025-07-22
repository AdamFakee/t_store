import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/product/product_add_button.dart';
import 'package:t_store/common/widgets/product/product_sale_tag.dart';
import 'package:t_store/common/widgets/texts/brand_icon_text.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/screens/product_details/product_details.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails());
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
                    imageUrl: TImage.shoeSnaker,
                    isNeworkImage: true,
                    fit: BoxFit.cover,
                  ),
                  // sale tag
                  Positioned(
                    top: 15,
                    left: 5,
                    child: TProductSaleTag(title: "20"),
                  ),
                  // heart button
                  Positioned(
                    top: 10,
                    right: 5,
                    child: TCircularIcon(
                      iconColor: Colors.red,
                      icon: Iconsax.heart5,
                    ),
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
                  TProductTitleText(title: "Nike Track suit Black"),
                  // brand
                  TBrandIconText(title: "Nike"),
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
                  TProductPriceText(price: '200'),
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
