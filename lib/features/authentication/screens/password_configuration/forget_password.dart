import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/features/authentication/controllers/password_configuration/forget_password_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/validators/validation.dart';

class TForgetPassword extends StatelessWidget {
  const TForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final ForgetPasswordController controller = Get.put(ForgetPasswordController());

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title & subTitle
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: TSizes.spaceBtwItems),

            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelLarge,
            ),

            SizedBox(height: TSizes.spaceBtwSections * 2),

            // email form field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: InputDecoration(
                  label: Text(
                    TTexts.email,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  prefixIcon: Icon(Iconsax.send1),
                ),
              ),
            ),

            SizedBox(height: TSizes.spaceBtwSections),

            // submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.resetPassword();
                },
                child: Text(TTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
