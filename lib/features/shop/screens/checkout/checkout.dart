import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/controllers/checkout_controller.dart';
import 'package:t_store/features/shop/controllers/products/cart_controller.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/coupon_code.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instace;
    final checkoutController = Get.put(CheckoutController());

    return Scaffold(
      /// --Button checkout
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          checkoutController.checkOut();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
              topLeft: Radius.circular(TSizes.sm),
              topRight: Radius.circular(TSizes.sm),
            ),
          ),
        ),
        child: Text(TTexts.checkOut),
      ),
      appBar: TAppBar(
        title: Text(
          TTexts.orderReview,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          spacing: TSizes.spaceBtwItems,
          children: [
            /// --Products
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartController.cartItems[index];
                  return TCartItem(
                    cartItem: cartItem,
                    cartItemIndex: index,
                    showAddButton: false,
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: TSizes.spaceBtwItems),
              ),
            ),

            /// --Coupon code
            TCouponCode(),

            /// --Billing section
            TBilling(),
          ],
        ),
      ),
    );
  }
}
