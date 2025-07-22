import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/product/product_review/product_review_rating_star.dart';
import 'package:t_store/common/widgets/product/product_review/review_title_text.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';

class TProductReviewRatings extends StatelessWidget {
  const TProductReviewRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// --Rating ( average & progress-indicator bar)
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "4.7",
                style: TextStyle(
                  color: TColors.black,
                  fontSize: 60,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  TRatingProgressIndicator(index: 5, value: 0.6),
                  TRatingProgressIndicator(index: 4, value: 0.7),
                  TRatingProgressIndicator(index: 3, value: 1),
                  TRatingProgressIndicator(index: 2, value: 0.2),
                  TRatingProgressIndicator(index: 1, value: 0.8),
                ],
              ),
            ),
          ],
        ),

        /// --Rating star & total rating
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TProductReviewRatingStar(initialRating: 3.7, itemPadding: 1,),
            TProductReivewTitleText(title: "222222"),
          ],
        ),
      ],
    );
  }
}
