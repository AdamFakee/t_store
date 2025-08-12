import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/chips/choice_chip.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/product/product_detail/product_detail_heading_text.dart';
import 'package:t_store/common/widgets/readmores/readmore_text.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/shop/controllers/products/variation_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/l10n/app_localizations.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TProductDetailAttributesSelection extends StatelessWidget {
  const TProductDetailAttributesSelection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());

    return Column(
      spacing: TSizes.md,
      children: [
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
                  TProductDetailHeadingText(title: TLanguage.of(context)?.variation ?? ""),
                  // price & stock status
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.md),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // price variation
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: TLanguage.of(context)?.price ?? "",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                if(controller.selectedVariation.value.salePrice > 0)
                                  TextSpan(
                                    text: "\$${controller.selectedVariation.value.price}",
                                    style: Theme.of(context).textTheme.bodyMedium!.apply(decoration: TextDecoration.lineThrough, color: Colors.grey),
                                  ),
                                TextSpan(
                                  text: " ${controller.getProductVariationPrice()}",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                          // stock status variation
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: TLanguage.of(context)?.stock ?? "",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                TextSpan(
                                  text: controller.variationStockStatus.value,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              if(controller.selectedVariation.value.description != null && controller.selectedVariation.value.description!.isNotEmpty)
                TReadmoreText(text: controller.selectedVariation.value.description!),
            ],
          ),
        ),

        /// --Colors selection
        Column(
          children: product.productAttributes!
              .map(
                (attribute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionTextHeading(title: attribute.name ?? ""),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Obx(
                      () => Wrap(
                        spacing: 8,
                        children: attribute.values!.map((attributeValue) {
                          final isSelected =
                              controller.selectedAttributes[attribute.name] ==
                              attributeValue;
                          final available = controller
                              .getAttributesAvailabilityInVariation(
                                product.productVariations!,
                                attribute.name!,
                              )
                              .contains(attributeValue);
                      
                          return TChoiceChip(
                            selected: isSelected,
                            text: attributeValue,
                            onSelected: available
                                ? (selected) {
                                    if (selected && available) {
                                      controller.onAttributeSelected(
                                        product,
                                        attribute.name,
                                        attributeValue,
                                      );
                                    }
                                  }
                                : null,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
