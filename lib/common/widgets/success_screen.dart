import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSuccessScreen extends StatelessWidget {
  // variables
  final String title, subTitle, image;
  final VoidCallback onPressed;

  const TSuccessScreen({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: TSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            // image
            Image.asset(
              image,
              width: THelperFunctions.screenWidth(context) * 0.8,
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            // title & subTitle
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: TSizes.spaceBtwItems),

            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: TSizes.spaceBtwSections),

            // continue button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(TTexts.continueText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
