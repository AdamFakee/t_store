import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    this.iconData = Iconsax.search_favorite,
    this.showBorder = true,
    this.showBackgroundColor = false,
    this.placeholder = TTexts.searchPlaceholder,
    this.padding = const EdgeInsetsGeometry.symmetric(horizontal: TSizes.md)
  });

  final IconData iconData;
  final bool showBorder, showBackgroundColor;
  final String placeholder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackgroundColor
              ? isDarkMode
                    ? TColors.light
                    : TColors.dark
              : TColors.lightContainer,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: Colors.grey) : null,
        ),
        child: Row(
          spacing: TSizes.md,
          children: [
            Icon(iconData, color: TColors.black),
            Text(
              "Search in Store",
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
