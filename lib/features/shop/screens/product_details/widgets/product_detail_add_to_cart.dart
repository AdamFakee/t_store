import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TProductDetailAddToCart extends StatelessWidget {
  const TProductDetailAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(TSizes.md),
      height: TSizes.bottomNavigationHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.sm),
          topRight: Radius.circular(TSizes.sm),
        ),
        color: TColors.darkGrey.withOpacity(0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// --Add icon button
          Row(
            spacing: TSizes.sm,
            children: [
              /// --Minus button
              TCircularIcon(
                iconColor: TColors.white,
                icon: Iconsax.minus,
                backroundColor: TColors.darkGrey,
                height: 30,
                width: 30,
                onPressed: () {},
              ),

              /// --NumOfProducts
              Text("2"),

              /// --Add button
              TCircularIcon(
                iconColor: TColors.white,
                icon: Iconsax.add,
                backroundColor: TColors.black,
                height: 30,
                width: 30,
                onPressed: () {},
              ),
            ],
          ),

          /// --Add to cart button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.black,
              side: BorderSide.none,
              padding: EdgeInsets.all(TSizes.md),
              textStyle: TextStyle(
                fontSize: 13
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            child: Text(TTexts.addToCart),
          ),
        ],
      ),
    );
  }
}
