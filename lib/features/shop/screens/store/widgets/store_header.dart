import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/brands/cards/brand_card.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/brands/all_brands.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';


class TStoreHeader extends StatelessWidget {
  const TStoreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instace;
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return SliverAppBar(
      floating: true, // hiển thị tabbar nổi lên
      pinned: true, // pin tabbar
      snap: false, // chịu
      backgroundColor: isDarkMode ? TColors.black : TColors.white,
      expandedHeight: 420,
      flexibleSpace: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            /// -- search bar
            const SizedBox(height: TSizes.spaceBtwItems),
            TSearchContainer(padding: EdgeInsets.all(0)),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// -- Featured Brands
            TSectionTextHeading(
              title: TTexts.featuredBrand,
              actionTitle: TTexts.viewAll,
              actionTitleColor: isDarkMode ? TColors.white : TColors.black,
              titleColor: isDarkMode ? TColors.white : TColors.black,
              onTap: () {
                Get.to(() => AllBrands());
              },
            ),

            /// -- Brands GRID
            TGridLayout(
              itemCount: 4,
              crossAxisCount: 2,
              mainAxisExtent: 80,
              itemBuilder: (_, _) => TBrandCard(
                numberOfProducts: 250,
                titleBrand: "Nike",
                imageUrl: TImage.brandNike,
              ),
            ),
          ],
        ),
      ),
      bottom: TTabBar(
        tabs: controller.featuredCategories.map((category) => Tab(child: Text(category.name),)).toList(),
      ),
    );
  }
}
