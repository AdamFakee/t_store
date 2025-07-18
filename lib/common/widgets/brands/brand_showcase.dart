import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/cards/brand_card_with_image.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        /// Brand
        TBrandCardWithImage(),
        SizedBox(height: TSizes.spaceBtwSections),

        /// Product
        // Product
      ],
      // itemBuilder: (_, int index) {
      //   return TBrandCardWithImage();
      // },
      // separatorBuilder: (_, int index) {
      //   return SizedBox(height: TSizes.spaceBtwItems);
      // },
      // itemCount: 4,
    );
  }
}
