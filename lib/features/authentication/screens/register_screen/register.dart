import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/login_signups/form_divider.dart';
import 'package:t_store/common/widgets/login_signups/social_buttons.dart';
import 'package:t_store/features/authentication/screens/register_screen/widgets/register_form.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 23,
          color: isDarkMode ? TColors.white : TColors.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.spaceBtwSections,
            children: [
              // title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
        
              // form
              TRegisterForm(),
        
              // divider
              TFormDivider(title: TTexts.orSignUpWith),
        
              // social buttons
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


