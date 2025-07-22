import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:t_store/utils/constants/colors.dart';

class TProductReviewRatingStar extends StatelessWidget {
  const TProductReviewRatingStar({super.key, this.itemSize = 20, required this.initialRating, this.itemPadding = 2});

  final double itemSize, initialRating;
  final double itemPadding;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: itemSize,
      initialRating: initialRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: itemPadding),
      itemBuilder: (context, _) => Icon(Icons.star, color: TColors.primary),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

