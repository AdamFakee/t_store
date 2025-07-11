import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TLoginFormHeader extends StatelessWidget {
  const TLoginFormHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: TSizes.spaceBtwItems,
      children: [
        Image.asset(isDarkMode ? TImage.lightAppLogo : TImage.darkAppLogo),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          TTexts.loginSubTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}