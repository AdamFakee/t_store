import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/product/product_review/review_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.index,
    required this.value,
  });

  final int index;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: TSizes.sm,
      children: [
        TProductReivewTitleText(title: index.toString()),
        Expanded(
          child: LinearProgressIndicator(
            backgroundColor: TColors.darkGrey.withOpacity(0.3),
            value: value,
            minHeight: 11,
            color: TColors.primary,
            borderRadius: BorderRadius.circular(TSizes.sm),
          ),
        ),
      ],
    );
  }
}
