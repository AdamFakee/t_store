import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/product/product_detail/product_detail_heading_text.dart';
import 'package:t_store/common/widgets/product/product_sale_tag.dart';
import 'package:t_store/common/widgets/readmores/readmore_text.dart';
import 'package:t_store/common/widgets/texts/brand_icon_text.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TProductDetailMetaData extends StatelessWidget {
  const TProductDetailMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSizes.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// --Discount & price
        Row(
          children: [
            TProductSaleTag(title: "20"),
            TProductPriceText(price: "12.6"),
          ],
        ),

        /// --Product name
        Text(
          TTexts.nikeAirShoes,
          style: Theme.of(context).textTheme.titleLarge,
        ),

        /// --Stock
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "${TTexts.stock} ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextSpan(
                text: TTexts.inStock,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),

        /// --Brand logo
        TBrandIconText(title: "Nike"),

        /// --Variation
        TRoundedContainer(
          backgroundColor: TColors.darkGrey.withOpacity(0.4),
          padding: EdgeInsets.all(TSizes.sm),
          radius: TSizes.sm + 3,
          child: Column(
            spacing: TSizes.sm,
            children: [
              Row(
                children: [
                  TProductDetailHeadingText(title: TTexts.variation),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: TTexts.price,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: "\$33.0",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: TTexts.stock,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: TTexts.inStock,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              
                ],
              ),

              TReadmoreText(text: TTexts.loremText)
            ],
          ),
        ),
      ],
    );
  }
}
