import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TResetPassword extends StatelessWidget {
  const TResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.highlight_remove_rounded,
              color: isDarkMode ? TColors.light : TColors.dark,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          spacing: TSizes.spaceBtwSections,
          children: [
            // image
            Image.asset(
              TImage.sendEmailSuccess,
              width: THelperFunctions.screenWidth(context) * 0.8,
            ),

            // title & subtitle
            Column(
              spacing: TSizes.spaceBtwItems,
              children: [
                Text(
                  TTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  TTexts.myEmailAddress,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  TTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),

            Column(
              children: [
                // Done button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(TTexts.done),
                  ),
                ),

                // resend email text button
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(TTexts.resendEmail),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
