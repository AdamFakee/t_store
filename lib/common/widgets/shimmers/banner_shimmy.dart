import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBannerShimmy extends StatelessWidget{
  const TBannerShimmy({super.key});

  @override
  Widget build(BuildContext context) {
    return TShimmerEffect(
      width: double.infinity,
      height: TSizes.imageCarouselHeight,
      radius: TSizes.md,
    );
  }

}