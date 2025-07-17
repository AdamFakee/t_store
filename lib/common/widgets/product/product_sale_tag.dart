import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

/// A widget for displaying a sale tag (e.g. 30% off).
/// The [suffix] is the unit or symbol displayed after the discount value (e.g. "%").
class TProductSaleTag extends StatelessWidget {
  const TProductSaleTag({
    super.key,
    this.height = 20,
    this.width = 40,
    this.radius = TSizes.sm,
    required this.title,
    this.suffix = "%",
  });

  final String suffix;
  final double height, width;
  final double radius;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TCircularContainer(
      height: height,
      width: width,
      radius: radius,
      backgroundColor:TColors.secondary,
      child: Text(
        title + suffix,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .apply(color: TColors.textPrimary),
      ),
    );
  }
}
