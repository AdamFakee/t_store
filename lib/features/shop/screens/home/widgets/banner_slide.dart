import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/shimmers/banner_shimmy.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBannerSlider extends StatelessWidget {
  const TBannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    return Obx(() {
      if (bannerController.loading.value) return TBannerShimmy();
      return Column(
        spacing: TSizes.md,
        children: [
          // slider
          CarouselSlider(
            items: bannerController.banners
                .map(
                  (banner) => TRoundedImage(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    isNeworkImage: true,
                    imageUrl: banner.image,
                    onPressed: () => Get.toNamed(banner.targetScreen),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              height: TSizes.imageCarouselHeight,
              onPageChanged: (index, _) => bannerController.updateIndex(index),
            ),
          ),
          // dot navigation
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: TSizes.sm,
              children: [
                for (int i = 0; i < bannerController.banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: i == bannerController.currentIndex.value
                        ? TColors.buttonPrimary
                        : TColors.buttonDisabled,
                  ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
