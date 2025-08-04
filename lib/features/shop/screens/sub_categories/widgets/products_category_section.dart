import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/shop/controllers/products/product_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductsCategorySection extends StatelessWidget {
  const TProductsCategorySection({super.key, required this.subCategory});

  final CategoryModel subCategory;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instace;
    final bool isDarkMode = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        TSectionTextHeading(
          title: subCategory.name,
          titleColor: isDarkMode ? TColors.light : TColors.black,
          actionTitle: TTexts.viewAll,
          actionTitleColor: isDarkMode ? TColors.light : TColors.black,
          onTap: () {
            Get.to(() => AllProducts(title: subCategory.name, futureMethod: productController.fetchProductsByCategoryId(subCategory.id, 10),));
          },
        ),

        /// --List products
        SizedBox(
          height: TSizes.productHorizontalHeight,
          child: FutureBuilder(
            future: productController.fetchProductsByCategoryId(subCategory.id),
            builder: (_, snapshot) {
              final loading = THorizontalProductShimmer();
              if (snapshot.connectionState == ConnectionState.waiting) {
                return loading;
              }

              final products = snapshot.data!;

              return ListView.separated(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => SizedBox(
                  width: THelperFunctions.screenWidth(context) - TSizes.defaultSpace * 2 - 20,
                  child: TProductCardHorizontal(product: products[index]),
                ),
                separatorBuilder: (_, _) => SizedBox(width: TSizes.spaceBtwItems),
                itemCount: products.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
