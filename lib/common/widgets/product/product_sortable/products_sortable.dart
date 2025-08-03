import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/dropdown_menus/dropdown_button_form_field.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/products/all_products_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';


class TProductsSortable extends StatelessWidget {
  const TProductsSortable({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = AllProductsController.instace;
    controller.asignAllForProducts(products);

    return Column(
      spacing: TSizes.spaceBtwSections,
      children: [
        /// --Drop menu item
        TDropdownButtonFormField(
          listOptions: ["Name", "Higher Price", "Lower Price", "Sale"],
          onChange: (String value) {
            controller.sortProducts(value);
          },
        ),
    
        /// --Products GRID
        Obx(
          () => TGridLayout(
            itemCount: controller.products.length,
            crossAxisCount: 2,
            mainAxisExtent: TSizes.productVerticalHeight,
            itemBuilder: (_, index) => TProductCardVertical(product: controller.products[index],),
          ),
        ),
      ],
    );
  }
}
