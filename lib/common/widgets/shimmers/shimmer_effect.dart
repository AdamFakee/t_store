import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect({
    super.key,
    this.width,
    this.height,
    this.radius = 15,
    this.margin
  });

  // variables
  final double? width, height;
  final double radius;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey[850]! : Colors.grey[350]!,
      highlightColor: isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: isDarkMode ? TColors.darkGrey : TColors.white,
        ),
      ),
    );
  }
}
