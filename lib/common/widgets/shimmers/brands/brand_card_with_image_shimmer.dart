import 'package:flutter/widgets.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/shimmers/brands/brand_card_shimmer.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandCardWithImageShimmer extends StatelessWidget {
  const TBrandCardWithImageShimmer({super.key, this.itemCount = 2});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_,_) => card(context), 
      separatorBuilder: (_,_) => SizedBox(height: TSizes.md,), 
      itemCount: itemCount
    );
  }

  Widget card (BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: EdgeInsetsGeometry.all(TSizes.sm),
      showBorder: true,
      backgroundColor: isDarkMode ? TColors.black : TColors.white,
      radius: TSizes.cardRadiusMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: TSizes.md,
        children: [
          SizedBox(
            height: 60,
            width: THelperFunctions.screenWidth(context) / 2.5,
            child: TBrandCardShimmer(),
          ),

          Row(
            spacing: TSizes.md,
            children: [
              Expanded(child: TShimmerEffect(height: 100)),
              Expanded(child: TShimmerEffect(height: 100)),
              Expanded(child: TShimmerEffect(height: 100)),
            ],
          ),
        ],
      ),
    );
  }
}
