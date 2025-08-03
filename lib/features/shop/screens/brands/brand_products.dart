import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/cards/brand_card.dart';
import 'package:t_store/common/widgets/product/product_sortable/products_sortable.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/shop/controllers/products/product_controller.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

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
                numberOfProducts: brand.productsCount,
                titleBrand: brand.name,
                imageUrl: brand.image,
                showBorder: true,
                padding: EdgeInsetsGeometry.all(TSizes.xs),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            /// Product sortable
            TSectionTextHeading(title: TTexts.products),
            SizedBox(height: TSizes.spaceBtwItems),
            FutureBuilder(
          future: productController.fetchProductsByBrandName(brand.name), 
          builder: (_, snapshot) {
            final loading = TVerticalProductShimmer();
            if(snapshot.connectionState == ConnectionState.waiting) {
              return loading;
            }

            if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: Text("Empty"),
              );
            }

            final products = snapshot.data!;

            return TProductsSortable(products: products);
          }
        ),
            // TProductsSortable(),
          ],
        ),
      ),
    );
  }
}
