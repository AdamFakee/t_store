import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/common/widgets/shimmers/category_shimers.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if(controller.loading.value) return TCategoryShimers();
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: Column(
          children: [
            // header
            TSectionTextHeading(title: TTexts.categoryPopularTitle),

            SizedBox(height: TSizes.md),
            // category scrollable
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.featuredCategories.length,
                itemBuilder: (_, index) {
                  final category = controller.featuredCategories[index];
                  return TVeritcalImageText(
                    title: category.name,
                    image: category.image,
                    isNetworkImage: true,
                    onTap: () {
                      Get.to(() => SubCategories());
                    },
                  );
                },
                separatorBuilder: (_, _) => SizedBox(width: TSizes.md),
              ),
            ),
          ],
        ),
      );
    });
  }
}
