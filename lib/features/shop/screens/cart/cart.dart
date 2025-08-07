import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/controllers/products/cart_controller.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instace;

    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Get.to(() => Checkout());
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(bottomLeft: Radius.zero, bottomRight: Radius.zero, 
              topLeft: Radius.circular(TSizes.sm),
              topRight: Radius.circular(TSizes.sm)
            )
          )
        ),
        child: Text(TTexts.checkOut),
      ),
      appBar: TAppBar(
        title: Text("Your Cart", style: Theme.of(context).textTheme.headlineMedium),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(
          () => ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = controller.cartItems[index];
                    return TCartItem(
                      cartItem: cartItem,
                      cartItemIndex: index,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: TSizes.spaceBtwItems),
                )

        ),
      ),
    );
  }
}
