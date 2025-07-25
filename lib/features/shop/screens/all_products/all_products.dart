import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/dropdown_menus/dropdown_button_form_field.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          TTexts.productPopularTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          spacing: TSizes.spaceBtwSections,
          children: [
            /// --Drop menu item
            TDropdownButtonFormField(
              listOptions: ["Name", "Price", "Size", "A-Z", "Z-A"],
              onChange: (String value) {
                print(value);
              },
            ),

            /// --Products GRID
            TGridLayout(
              itemCount: 5,
              crossAxisCount: 2,
              mainAxisExtent: TSizes.productVerticalHeight,
              itemBuilder: (_, index) => TProductCardVertical(),
            ),
          ],
        ),
      ),
    );
  }
}
