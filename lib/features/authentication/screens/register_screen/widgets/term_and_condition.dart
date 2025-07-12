import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TTermAndConditionCheckBox extends StatelessWidget {
  const TTermAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        RichText(
          text: TextSpan(
            text: "${TTexts.iAgreeTo} ",
            style: Theme.of(context).textTheme.titleSmall,
            children: [
              TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.titleMedium!
                    .apply(
                      color: isDarkMode ? TColors.light : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: isDarkMode ? TColors.light : TColors.primary,
                    ),
              ),
              TextSpan(
                text: " ${TTexts.and} ",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.titleMedium!
                    .apply(
                      color: isDarkMode ? TColors.light : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: isDarkMode ? TColors.light : TColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}