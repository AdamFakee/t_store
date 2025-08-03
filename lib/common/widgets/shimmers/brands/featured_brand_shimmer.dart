import 'package:flutter/widgets.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TFeaturedBrandShimmer extends StatelessWidget {
  const TFeaturedBrandShimmer({super.key, this.itemCount = 4});

  /// determin how many widget is shown in [TGridLayout]
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      crossAxisCount: 2,
      mainAxisExtent: 80,
      itemBuilder: (_, _) => Row(
        spacing: TSizes.sm,
        children: [
          // icon
          Flexible(
            child: TShimmerEffect(radius: TSizes.md,),
          ),
          // title
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TShimmerEffect(radius: TSizes.md, height: 14,),
                TShimmerEffect(radius: TSizes.md, height: 14,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
