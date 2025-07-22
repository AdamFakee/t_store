import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/texts/brand_icon_text.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/screens/cart/widgets/product_text_rich.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: TSizes.md,
      children: [
        TRoundedImage(
          imageUrl: TImage.tShirt,
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
              TBrandIconText(title: "Nike"),
              TProductTitleText(title: TTexts.phoneNumberTitle),
              Row(
                spacing: TSizes.sm,
                children: [
                  TProductTextRich(prefixTitle: TTexts.color, title: "Green"),
                  TProductTextRich(prefixTitle: TTexts.size, title: "Eu 24"),
                ],
              ),

              SizedBox(height: 5,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// --Adjust num of products
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
                        onPressed: () {},
                      ),

                      /// --NumOfProducts
                      Text("2"),

                      /// --Add button
                      TCircularIcon(
                        iconColor: TColors.white,
                        icon: Iconsax.add,
                        backroundColor: TColors.primary,
                        height: 30,
                        width: 30,
                        onPressed: () {},
                      ),
                    ],
                  ),

                  /// --Product price
                  TProductPriceText(price: "123", style: Theme.of(context).textTheme.titleLarge,),

                  
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
