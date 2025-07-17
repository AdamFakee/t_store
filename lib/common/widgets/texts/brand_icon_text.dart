import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';


class TBrandIconText extends StatelessWidget {
  const TBrandIconText({
    super.key, required this.title, this.icon, this.textStyle, this.maxLines = 1,
  });

  final String title;
  final Widget? icon;
  final TextStyle? textStyle;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: TSizes.xs,
      children: [
        Text(
          title,
          style: textStyle ?? Theme.of(context).textTheme.titleMedium,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        icon ?? Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}