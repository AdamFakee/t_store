import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/checkout_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

/// this widget for show price, fee, shiping fee in "title: value"
class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());

    return Column(
      spacing: TSizes.sm,
      children: [
        Obx(() => amountText(title: TTexts.subtotal, amount: controller.subTotal.value, context: context)),
        amountText(title: TTexts.shippingFee, amount: controller.shippingFee, context: context),
        amountText(title: TTexts.taxFee, amount: controller.taxFee, context: context),
        /// --order total
        Obx(
          () => amountText(
            title: TTexts.orderTotal,
            amount: controller.orderTotal.value,
            context: context,
            isLargeText: true,
          ),
        ),
      ],
    );
  }

  /// show "title": "value"
  Widget amountText({
    required String title,
    required double amount,
    required BuildContext context,
    bool isLargeText = false,
  }) {
    const prefixAmount = "\$";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        Text(
          '$prefixAmount${amount.toStringAsFixed(2)}',
          style: isLargeText
              ? Theme.of(context).textTheme.titleMedium
              : Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
