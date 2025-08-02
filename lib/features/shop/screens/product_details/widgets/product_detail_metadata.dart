import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/product/product_detail/product_detail_heading_text.dart';
import 'package:t_store/common/widgets/product/product_sale_tag.dart';
import 'package:t_store/common/widgets/readmores/readmore_text.dart';
import 'package:t_store/common/widgets/texts/brand_icon_text.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/features/shop/controllers/products/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TProductDetailMetaData extends StatelessWidget {
  const TProductDetailMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instace;
    final salePercentage = controller.getDiscoutPercent(product.price, product.salePrice);
    final price = controller.getProductPrices(product);

    return Column(
      spacing: TSizes.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// --Discount & price
        Row(
          children: [
            if(salePercentage != null) 
              TProductSaleTag(title: salePercentage),
            TProductPriceText(price: price, curencySign: " ",),
          ],
        ),

        /// --Product name
        Text(
          product.title,
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
                text: controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),

        /// --Brand logo
        TBrandIconText(title: "Nike"),

      ],
    );
  }
}
