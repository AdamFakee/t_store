import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/sign_in/sign_in_controller.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/register_screen/register.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Form(
      key: controller.signInFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: TSizes.spaceBtwItems,
        children: [
          // Text field
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.send1),
              label: Text(
                TTexts.email,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.scanner),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                ),
                label: Text(
                  TTexts.password,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),

          // Remember me + forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (_) => controller.rememberMe.value = !controller.rememberMe.value,
                    ),
                    Text(
                      TTexts.rememberMe,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
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
                controller.signInWithEmailAndPassword();
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
      ),
    );
  }
}
