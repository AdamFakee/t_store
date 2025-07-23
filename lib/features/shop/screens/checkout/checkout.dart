import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/coupon_code.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// --Button checkout
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
        title: Text(TTexts.orderReview, style: Theme.of(context).textTheme.headlineMedium),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          spacing: TSizes.spaceBtwItems,
          children: [
            /// --Products
            TCartItem(showAddButton: false,),
            TCartItem(showAddButton: false,),

            /// --Coupon code
            TCouponCode(),

            /// --Billing section
            TBilling()
          ],
        ),
      ),
    );
  }
}

