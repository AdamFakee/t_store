import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/product/product_review/review_title_text.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/product_review_rating.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TRoundedContainer(
        height: 50,
        width: 50, 
        radius: TSizes.all,
        backgroundColor: TColors.primary,
        child: Icon(Icons.add, color: TColors.white,),
      ),
      appBar: TAppBar(
        title: Text(
          TTexts.reviewAndRatingTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              /// --Sub title
              TProductReivewTitleText(title: TTexts.reviewAndRatingSubTitle),
              SizedBox(height: TSizes.spaceBtwItems),

              /// --Rating
              TProductReviewRatings(),
              SizedBox(height: TSizes.spaceBtwSections),

              /// --Review content
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, __) => TUserReviewCard(),
                separatorBuilder: (_, __) =>
                    const SizedBox(height: TSizes.spaceBtwItems),
                itemCount: 4,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
