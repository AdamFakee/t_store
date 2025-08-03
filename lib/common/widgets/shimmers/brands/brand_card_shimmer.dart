import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBrandCardShimmer extends StatelessWidget {
  const TBrandCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: TSizes.sm,
      children: [
        // icon
        Flexible(child: TShimmerEffect(radius: TSizes.md)),
        // title
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TShimmerEffect(radius: TSizes.md, height: 14),
              TShimmerEffect(radius: TSizes.md, height: 14),
            ],
          ),
        ),
      ],
    );
  }
}
