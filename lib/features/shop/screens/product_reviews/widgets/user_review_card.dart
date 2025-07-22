import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/product/product_review/product_review_rating_star.dart';
import 'package:t_store/common/widgets/readmores/readmore_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSizes.sm,
      children: [
        /// --User & three dot bar
        Row(
          children: [
            /// --User avart & user name
            Expanded(
              child: Row(
                spacing: TSizes.md,
                children: [
                  TRoundedImage(imageUrl: TImage.shoeSnaker, isNeworkImage: true, width: 50, height: 50, fit: BoxFit.cover, radius: TSizes.all,),
                  Text("john doe", style: Theme.of(context).textTheme.titleLarge,),
                ],
              ),
            ),

            /// --three dots button
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],
        ),

        /// --Rating star & date
        Row(
          spacing: TSizes.sm,
          children: [
            TProductReviewRatingStar(initialRating: 3.4, itemPadding: 0, itemSize: 16,),
            Text(TTexts.dobValue, style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),

        /// --User review text
        TReadmoreText(text: TTexts.loremText),

        /// --Shop response
        TRoundedContainer(
          backgroundColor: TColors.darkGrey.withOpacity(0.5),
          radius: TSizes.sm,
          padding: EdgeInsets.all(TSizes.md),
          child: Column(
            spacing: TSizes.sm,
            children: [
              /// --Shop name & date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(TTexts.myName,),
                  Text(TTexts.dobValue)
                ],
              ),

              /// --Shop response text
              TReadmoreText(text: TTexts.loremText),
            ],
          ),
        )
      ],
    );
  }
}