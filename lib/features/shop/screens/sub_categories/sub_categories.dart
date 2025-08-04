import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/shimmers/sub_category_shimmer.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/home/widgets/banner_slide.dart';
import 'package:t_store/features/shop/screens/sub_categories/widgets/products_category_section.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace,
          vertical: TSizes.md,
        ),
        child: Column(
          spacing: TSizes.spaceBtwSections / 2,
          children: [
            // banner
            TBannerSlider(),

            // product of sub category
            FutureBuilder(
              future: controller.fetchSubCategoriesByCategoryId(category.id),
              builder: (_, snapshot) {
                final loading = TSubCategoryShimmer();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loading;
                }

                final subCategories = snapshot.data!;

                return Column(
                  children: subCategories.map((subCategory) => TProductsCategorySection(subCategory: subCategory,)).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
