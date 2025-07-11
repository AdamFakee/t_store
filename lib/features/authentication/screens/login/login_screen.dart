import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/login_signups/form_divider.dart';
import 'package:t_store/common/widgets/login_signups/social_buttons.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/device/device_utility.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          top: TDeviceUtils.getAppBarHeight(),
          left: TSizes.defaultSpace,
          right: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Form header
              TLoginFormHeader(),

              const SizedBox(height: TSizes.spaceBtwSections),

              // form
              TLoginForm(),

              const SizedBox(height: TSizes.spaceBtwSections),

              // devider text
              TFormDivider(title: TTexts.orSignInWith,),

              const SizedBox(height: TSizes.spaceBtwSections),
              // footer
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}



