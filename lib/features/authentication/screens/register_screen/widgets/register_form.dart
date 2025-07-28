import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/sign_up/sign_up_controller.dart';
import 'package:t_store/features/authentication/screens/register_screen/widgets/term_and_condition.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class TRegisterForm extends StatelessWidget {
  const TRegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        spacing: TSizes.spaceBtwInputFields,
        children: [
          Row(
            spacing: TSizes.spaceBtwInputFields,
            children: [
              
              // fist name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmpty("First Name", value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: TTexts.firstName,
                    labelStyle: Theme.of(context).textTheme.titleLarge,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
              
              // last name
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmpty("Last Name", value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: TTexts.lastName,
                    labelStyle: Theme.of(context).textTheme.titleLarge,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
              
          // user name
          TextFormField(
            controller: controller.userName,
            validator: (value) => TValidator.validateEmpty("User Name", value),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: TTexts.username,
              labelStyle: Theme.of(context).textTheme.titleLarge,
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),
              
          // email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: TTexts.email,
              labelStyle: Theme.of(context).textTheme.titleLarge,
              prefixIcon: const Icon(Iconsax.bag_cross),
            ),
          ),
              
          // phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: TTexts.phoneNo,
              labelStyle: Theme.of(context).textTheme.titleLarge,
              prefixIcon: const Icon(Iconsax.call),
            ),
          ),
              
          // password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: TTexts.password,
                labelStyle: Theme.of(context).textTheme.titleLarge,
                prefixIcon: Icon(Iconsax.scanner),
                suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
              ),
            ),
          ),
              
          // agree term
          TTermAndConditionCheckBox(),
          // create account button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.signUp();
              },
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

