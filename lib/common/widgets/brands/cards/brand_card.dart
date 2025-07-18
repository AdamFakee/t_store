import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/texts/brand_icon_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

/// a widget contain shot desc for brand ( name, numberOfProducts in brand )
/// 
/// properties:
/// [imageUrl] : brand's logo
/// [isNetworkImage] : using url or asset (image)
/// [suffix] : a part of [numberOfProducts]
/// [titleBrand] : brand name
class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.imageUrl,
    this.isNetworkImage = true,
    required this.titleBrand,
    this.suffix = " products",
    required this.numberOfProducts
  });

  final String imageUrl;
  final bool isNetworkImage;
  final String titleBrand;
  final String suffix;
  final int numberOfProducts;

  @override
  Widget build(BuildContext context) {
    return TCircularContainer(
      padding: EdgeInsetsGeometry.symmetric(horizontal: TSizes.sm),
      radius: TSizes.cardRadiusSm,
      child: Row(
        spacing: TSizes.sm,
        children: [
          // icon
          Flexible(
            child: TRoundedImage(
              radius: TSizes.sm,
              imageUrl: TImage.brandNike,
              isNeworkImage: true,
            ),
          ),
          // title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TBrandIconText(title: titleBrand),
                Text(
                  numberOfProducts.toString() + suffix,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.apply(color: TColors.darkGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
