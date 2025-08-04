import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/product/favorite_button/favorite_button.dart';
import 'package:t_store/features/shop/controllers/products/image_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return Stack(
      children: [
        /// --Main Large Image (showing)
        SizedBox(
          height: TSizes.headerContainerHome,
          child: Obx(() {
            final image = controller.selectedProductImage.value;
            return GestureDetector(
              onTap: () => controller.showImagePopup(image),
              child: CachedNetworkImage(imageUrl: controller.selectedProductImage.value, fit: BoxFit.cover, width: double.infinity,)
            );
          }),
        ),

        /// --Images slider (can choose)
        Positioned(
          left: 30,
          bottom: 30,
          child: SizedBox(
            height: TSizes.imageSliderSize,
            width: THelperFunctions.screenWidth(context) - 30,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Obx(() {
                final imageSelected = controller.selectedProductImage.value == images[index];
                return TRoundedImage(
                  imageUrl: images[index],
                  isNeworkImage: true,
                  width: TSizes.imageSliderSize,
                  fit: BoxFit.cover,
                  border: Border.all(color: imageSelected ?TColors.buttonPrimary : Colors.transparent),
                  onPressed: () =>
                      controller.selectedProductImage.value = images[index],
                );
              }),
              separatorBuilder: (_, __) => SizedBox(width: TSizes.md),
              itemCount: images.length,
              physics: AlwaysScrollableScrollPhysics(),
            ),
          ),
        ),

        /// --Header
        TAppBar(
          showBackButton: true,
          actions: [TFavoriteButton(productId: product.id)],
        ),
      ],
    );
  }
}
