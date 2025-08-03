import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/brands/cards/brand_card.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/controllers/products/product_controller.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandCardWithImage extends StatelessWidget {
  const TBrandCardWithImage({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    final brandController = Get.put(BrandController());
    final productController = Get.put(ProductController());

    return Column(
      children: [
        TRoundedContainer(
          padding: EdgeInsetsGeometry.all(TSizes.sm),
          showBorder: true,
          backgroundColor: isDarkMode ? TColors.black : TColors.white,
          radius: TSizes.cardRadiusMd,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TBrandCard(
                  imageUrl: brand.image,
                  titleBrand: brand.name,
                  numberOfProducts: brand.productsCount,
                ),
              ),

              /// -- best 3 product images
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: FutureBuilder(
                  future: productController.fetchFeaturedProductByBrandName(
                    brand.name,
                  ),
                  builder: (_, snapshot) {
                    final loading = Row(
                      spacing: TSizes.md,
                      children: [
                        Expanded(child: TShimmerEffect(height: 70)),
                        Expanded(child: TShimmerEffect(height: 70)),
                        Expanded(child: TShimmerEffect(height: 70)),
                      ],
                    );
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return loading;
                    }

                    final products = snapshot.data!;
                    final images = productController.getRandomImagesFromProducts(
                      products,
                    );

                    return images.isNotEmpty
                        ? Row(
                            spacing: TSizes.sm,
                            children: images
                                .map(
                                  (image) => _brandTopProductImageWidget(
                                    imageUrl: image,
                                    isNetworkImage: true,
                                  ),
                                )
                                .toList(),
                          )
                        : const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _brandTopProductImageWidget({
    required String imageUrl,
    bool isNetworkImage = true,
  }) {
    return Expanded(
      child: TRoundedImage(
        height: 100,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        isNeworkImage: isNetworkImage,
      ),
    );
  }
}
