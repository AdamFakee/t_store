import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/shop/controllers/products/product_controller.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/banner_slide.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_category.dart';
import 'package:t_store/l10n/app_localizations.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    final productController = Get.put(ProductController());
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Home app bar
                  THomeAppbar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  // search
                  TSearchContainer(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // category
                  THomeCategory(),
                ],
              ),
            ),

            // body
            Padding(
              padding: EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  TBannerSlider(),

                  const SizedBox(height: TSizes.spaceBtwItems,),

                  TSectionTextHeading(
                    title: TLanguage.of(context)?.productPopularTitle ?? "",
                    titleColor: isDarkMode ? TColors.light : TColors.black,
                    actionTitle: TLanguage.of(context)?.viewAll ?? "",
                    actionTitleColor: isDarkMode ? TColors.light : TColors.black,
                    onTap: () {
                      Get.to(() => AllProducts(
                        title: TTexts.productPopularTitle,
                        query: FirebaseFirestore.instance.collection("Products").where("IsFeatured", isEqualTo: true).limit(8),
                      ));
                    },
                  ),
                  // list featured products
                  Obx(
                    () {
                      if(productController.loading.value) return TVerticalProductShimmer();
                      return TGridLayout(
                        itemCount: productController.featuredProducts.length,
                        crossAxisCount: 2,
                        mainAxisExtent: TSizes.productVerticalHeight,
                        itemBuilder: (_, index) => TProductCardVertical(product: productController.featuredProducts[index],),
                      );
                    }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
