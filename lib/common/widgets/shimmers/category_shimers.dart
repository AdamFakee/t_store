import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TCategoryShimers extends StatelessWidget {
  const TCategoryShimers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: Column(
          children: [
            // header
            TSectionTextHeading(title: TTexts.categoryPopularTitle),

            SizedBox(height: TSizes.md),
            // category scrollable
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (_, index) {
                  return Column(
                    spacing: TSizes.sm,
                    children: [
                      // image
                      TShimmerEffect(
                        width: 56,
                        height: 56,
                        radius: TSizes.all,
                      ),
                      // text
                      TShimmerEffect(
                        width: 50,
                        height: 6,
                        radius: TSizes.all,
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, _) => SizedBox(width: TSizes.md),
              ),
            ),
          ],
        ),
      );
  }

}