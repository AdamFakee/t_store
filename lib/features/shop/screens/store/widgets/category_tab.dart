import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/cards/brand_card_with_image.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        /// Brand
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) {
            return TBrandCardWithImage();
          },
          separatorBuilder: (_, int index) {
            return SizedBox(height: TSizes.spaceBtwItems);
          },
          itemCount: 4,
        ),
        SizedBox(height: TSizes.spaceBtwSections),

        /// Product
        TSectionTextHeading(
          title: TTexts.youMightLike,
          actionTitle: TTexts.viewAll,
          actionTitleColor: isDarkMode ? TColors.white : TColors.black,
          titleColor: isDarkMode ? TColors.white : TColors.black,
        ),
        TGridLayout(
          itemCount: 4,
          crossAxisCount: 1,
          mainAxisExtent: TSizes.productHorizontalHeight,
          itemBuilder: (_, index) => TProductCardHorizontal(),
        ),
      ],
    );
  }
}
