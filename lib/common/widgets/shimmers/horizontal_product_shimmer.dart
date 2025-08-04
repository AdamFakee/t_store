import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      crossAxisCount: 1,
      mainAxisExtent: THelperFunctions.screenWidth(context) - TSizes.defaultSpace * 2 - 50,
      itemBuilder: (_, index) => Row(
        spacing: TSizes.sm,
        children: [
          // image 
          TShimmerEffect(width: 180, radius: TSizes.md,),
          SizedBox(height: TSizes.sm,),
          // product name & brand
          Expanded(
            child: Column(
              spacing: TSizes.sm,
              children: [
                TShimmerEffect(height: 10, width: double.infinity, radius: TSizes.md,),
                TShimmerEffect(height: 10, radius: TSizes.md,),
                // price
                Spacer(),
                TShimmerEffect(height: 20, radius: TSizes.sm,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}