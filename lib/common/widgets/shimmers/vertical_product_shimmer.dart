import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: 6,
      crossAxisCount: 2,
      mainAxisExtent: TSizes.productVerticalHeight,
      itemBuilder: (_, index) => Column(
        children: [
          // image 
          TShimmerEffect(height: 180, radius: TSizes.md,),
          SizedBox(height: TSizes.sm,),
          // product name & brand
          Column(
            spacing: TSizes.sm,
            children: [
              TShimmerEffect(height: 10, radius: TSizes.md,),
              TShimmerEffect(height: 10, radius: TSizes.md,),
            ],
          ),
          // price
          Spacer(),
          TShimmerEffect(height: 30, radius: TSizes.md,),
        ],
      ),
    );
  }
}