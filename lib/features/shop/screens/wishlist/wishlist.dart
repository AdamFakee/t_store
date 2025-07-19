import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          /// header
          TAppBar(
            title: Text(
              TTexts.wishList,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.add),
                color: isDarkMode ? TColors.light : Colors.black,
              ),
            ],
          ),

          /// products GRID
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: TSizes.sm),
            child: TGridLayout(
              itemCount: 14,
              crossAxisCount: 2,
              mainAxisExtent: TSizes.productVerticalHeight,
              itemBuilder: (_, index) => TProductCardVertical(),
            ),
          ),
        ],
      ),
    );
  }
}
