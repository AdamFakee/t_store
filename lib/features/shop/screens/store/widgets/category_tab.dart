import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/brands/cards/brand_card_with_image.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmers/brands/brand_card_with_image_shimmer.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/controllers/products/product_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/l10n/app_localizations.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final productController = Get.put(ProductController());
    final bool isDarkMode = THelperFunctions.isDarkMode(context);

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        /// Brand
        FutureBuilder(
          future: brandController.fetchBrandsByCategoryId(category.id),
          builder: (_, snapshot) {
            final loading = TBrandCardWithImageShimmer();
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading;
            }

            if (!snapshot.hasData ||
                snapshot.data == null ||
                snapshot.data!.isEmpty) {
              return Center(child: Text("Empty"));
            }

            final brands = snapshot.data!;

            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) {
                return TBrandCardWithImage(brand: brands[index]);
              },
              separatorBuilder: (_, int index) {
                return SizedBox(height: TSizes.spaceBtwItems);
              },
              itemCount: brands.length,
            );
          },
        ),
        SizedBox(height: TSizes.spaceBtwSections),

        /// Product
        TSectionTextHeading(
          title: TLanguage.of(context)?.youMightLike ?? "",
          actionTitle: TLanguage.of(context)?.viewAll ?? "",
          actionTitleColor: isDarkMode ? TColors.white : TColors.black,
          titleColor: isDarkMode ? TColors.white : TColors.black,
          onTap: () {
            Get.to(
              AllProducts(
                title: "Products of ${category.name}",
                futureMethod: productController.fetchProductsByCategoryId(
                  category.id, 99
                ),
              ),
            );
          },
        ),

        FutureBuilder(
          future: productController.fetchProductsByCategoryId(category.id),
          builder: (_, snapshot) {
            final loading = TVerticalProductShimmer();
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading;
            }

            final products = snapshot.data!;

            return TGridLayout(
              itemCount: products.length,
              crossAxisCount: 2,
              mainAxisExtent: TSizes.productVerticalHeight,
              itemBuilder: (_, index) =>
                  TProductCardVertical(product: products[index]),
            );
          },
        ),
      ],
    );
  }
}
