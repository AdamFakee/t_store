import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

/// this widget for show price, fee, shiping fee in "title: value"
class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSizes.sm,
      children: [
        amountText(title: TTexts.subtotal, amount: 25.0, context: context),
        amountText(title: TTexts.shippingFee, amount: 25.0, context: context),
        amountText(title: TTexts.taxFee, amount: 25.0, context: context),
        /// --order total
        amountText(
          title: TTexts.orderTotal,
          amount: 25.0,
          context: context,
          isLargeText: true,
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
