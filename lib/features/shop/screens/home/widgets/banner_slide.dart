import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBannerSlider extends StatelessWidget {
  const TBannerSlider({super.key, required this.banners});

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Column(
      spacing: TSizes.md,
      children: [
        // slider
        CarouselSlider(
          items: banners.map((imageUrl) => TRoundedImage(isNeworkImage: true, imageUrl: imageUrl)).toList() ,
          options: CarouselOptions(
            viewportFraction: 1,
            height: TSizes.imageCarouselHeight,
            onPageChanged: (index, _) => homeController.updateIndex(index),
          ),
        ),
        // dot navigation
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: TSizes.sm,
            children: [
              for (int i = 0; i < 3; i++)
                TCircularContainer(
                  width: 20,
                  height: 4,
                  backgroundColor: i == homeController.currentIndex.value
                      ? TColors.buttonPrimary
                      : TColors.buttonDisabled,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
