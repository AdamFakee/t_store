import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/cards/brand_card.dart';
import 'package:t_store/common/widgets/product/product_sortable/products_sortable.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          TTexts.brand,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand
            SizedBox(
              height: 60,
              child: TBrandCard(
                numberOfProducts: 250,
                titleBrand: "Nike",
                imageUrl: TImage.brandNike,
                showBorder: true,
                padding: EdgeInsetsGeometry.all(TSizes.xs),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            /// Product sortable
            TSectionTextHeading(title: TTexts.products),
            SizedBox(height: TSizes.spaceBtwItems),
            TProductsSortable(),
          ],
        ),
      ),
    );
  }
}
