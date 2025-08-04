import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSubCategoryShimmer extends StatelessWidget {
  const TSubCategoryShimmer({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (_,_) => _subCategory(), 
      separatorBuilder: (_,_) => const SizedBox(height: TSizes.md,), 
      itemCount: itemCount
    );
  }

  Widget _subCategory() {
    return Column(
      spacing: TSizes.spaceBtwSections / 2,
      children: [
        // section title
        SizedBox(
          height: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TShimmerEffect(height: double.infinity, width: 140,),
              TShimmerEffect(height: double.infinity, width: 60,),
            ],
          ),
        ),
        SizedBox(
          height: TSizes.productHorizontalHeight,
          child: THorizontalProductShimmer(itemCount: 3,)
        )
      ],
    );
  }
}