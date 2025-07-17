import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';


class TProductAddButton extends StatelessWidget {
  const TProductAddButton({
    super.key, this.borderRadius, this.backgroundColor = TColors.buttonPrimary, this.width = TSizes.iconLg * 1.2, this.height = TSizes.iconLg * 1.2,
  });

  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final double width, height;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.only(
          topLeft: Radius.circular(TSizes.md),
          bottomRight: Radius.circular(TSizes.md),
        ),
        color: backgroundColor,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Icon(Iconsax.add, color: TColors.white)),
    );
  }
}

