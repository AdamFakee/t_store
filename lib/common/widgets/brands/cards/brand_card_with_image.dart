import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/brands/cards/brand_card.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBrandCardWithImage extends StatelessWidget {
  const TBrandCardWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TRoundedContainer(
          padding: EdgeInsetsGeometry.all(TSizes.sm),
          showBorder: true,
          radius: TSizes.cardRadiusMd,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TBrandCard(
                  imageUrl: TImage.brandNike,
                  titleBrand: "Nike",
                  numberOfProducts: 25,
                ),
              ),

              /// -- best 3 product images
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Row(
                  spacing: TSizes.sm,
                  children: [
                    brandTopProductImageWidget( imageUrl: TImage.shoeSnaker),
                    brandTopProductImageWidget( imageUrl: TImage.tShirt),
                    brandTopProductImageWidget( imageUrl: TImage.shoeSnaker),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget brandTopProductImageWidget({
    required String imageUrl, bool isNetworkImage = true
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
