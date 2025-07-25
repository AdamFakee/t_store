import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductsCategorySection extends StatelessWidget {
  const TProductsCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionTextHeading(
          title: "Sport Equiments",
          titleColor: isDarkMode ? TColors.light : TColors.black,
          actionTitle: TTexts.viewAll,
          actionTitleColor: isDarkMode ? TColors.light : TColors.black,
        ),

        /// --List products
        SizedBox(
          height: TSizes.productHorizontalHeight,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, _) => SizedBox(
              width:
                  THelperFunctions.screenWidth(context) -
                  TSizes.defaultSpace * 2 -
                  50,
              child: TProductCardHorizontal(),
            ),
            separatorBuilder: (_, _) => SizedBox(width: TSizes.spaceBtwItems),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
