import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/products/favorite_product_controller.dart';
import 'package:t_store/l10n/app_localizations.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteProductController.instace;
    final bool isDarkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar:
          /// header
          TAppBar(
            title: Text(
              TLanguage.of(context)?.wishList ?? "",
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// products GRID
            FutureBuilder(
              future: controller.fetchProductsByProductIds(),
              builder: (_, snapshot) {
                final loading = TVerticalProductShimmer();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loading;
                }

                final products = snapshot.data!;

                return TGridLayout(
                  itemCount: products.length,
                  crossAxisCount: 2,
                  mainAxisExtent: TSizes.productVerticalHeight,
                  itemBuilder: (_, index) =>
                      TProductCardVertical(product: products[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
