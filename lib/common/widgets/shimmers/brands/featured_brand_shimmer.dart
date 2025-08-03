import 'package:flutter/widgets.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/brands/brand_card_shimmer.dart';

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
      itemBuilder: (_, _) => TBrandCardShimmer()
    );
  }
}
