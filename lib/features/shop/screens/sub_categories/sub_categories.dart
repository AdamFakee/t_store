import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/banner_slide.dart';
import 'package:t_store/features/shop/screens/sub_categories/widgets/products_category_section.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
          title: Text(
            "Sports",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackButton: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.md),
          child: Column(
            spacing: TSizes.spaceBtwSections / 2,
            children: [
              TBannerSlider(
                    banners: [
                      TImage.promoBanner1,
                      TImage.promoBanner2,
                      TImage.promoBanner3,
                    ],
                  ),
              TProductsCategorySection(),
              TProductsCategorySection(),
              TProductsCategorySection(),
              TProductsCategorySection(),
              TProductsCategorySection()
            ],
          ),
        ),
      );
  }
}