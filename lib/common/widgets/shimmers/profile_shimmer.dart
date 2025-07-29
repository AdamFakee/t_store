import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TProfileShimmer extends StatelessWidget {
  const TProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --Avatar
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TShimmerEffect(width: 66, height: 66, radius: TSizes.all),
                    ],
                  ),
                ),
              ),

              SizedBox(height: TSizes.spaceBtwItems),
              TSectionTextHeading(title: TTexts.profileInfoTitle),

              /// --Name
              _profileMenuShimmer(),

              /// --UserName
              _profileMenuShimmer(),

              Divider(),

              SizedBox(height: TSizes.spaceBtwItems),
              TSectionTextHeading(title: TTexts.personalInfoTitle),

              /// --User Id
              _profileMenuShimmer(),

              /// --Email
              _profileMenuShimmer(),

              /// --Phone
              _profileMenuShimmer(),

              /// --gender
              _profileMenuShimmer(),

              /// --date of birth
              _profileMenuShimmer(),

              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileMenuShimmer() {
    return TShimmerEffect(
      height: 30,
      margin: const EdgeInsetsGeometry.symmetric(
        vertical: TSizes.spaceBtwItems / 1.5,
      ),
    );
  }
}
