import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/dropdown_menus/dropdown_button_form_field.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';


class TProductsSortable extends StatelessWidget {
  const TProductsSortable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
