import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/register_screen/register.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: TSizes.spaceBtwItems,
      children: [
        // Text field
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.send1),
            label: Text(
              TTexts.email,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.scanner),
            suffixIcon: Icon(Iconsax.eye_slash),
            label: Text(
              TTexts.password,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        
        // Remember me + forgot password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {
                    print(value);
                  },
                ),
                Text(
                  TTexts.rememberMe,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.to(TForgetPassword());
              },
              child: Text(
                TTexts.forgetPassword,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),

        // Signup button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.offAll(NavigationMenu());
            },
            child: Text(TTexts.signIn),
          ),
        ),

        // Create account button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Get.to(() => const RegisterScreen());
            },
            child: Text(TTexts.createAccount),
          ),
        ),

      ],
    );
  }
}