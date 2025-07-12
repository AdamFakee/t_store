import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/register_screen/widgets/term_and_condition.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TRegisterForm extends StatelessWidget {
  const TRegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSizes.spaceBtwInputFields,
      children: [
        Row(
          spacing: TSizes.spaceBtwInputFields,
          children: [
            
            // fist name
            Expanded(
              child: TextFormField(
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
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: TTexts.username,
            labelStyle: Theme.of(context).textTheme.titleLarge,
            prefixIcon: const Icon(Iconsax.user_edit),
          ),
        ),
            
        // email
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: TTexts.email,
            labelStyle: Theme.of(context).textTheme.titleLarge,
            prefixIcon: const Icon(Iconsax.bag_cross),
          ),
        ),
            
        // phone number
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: TTexts.phoneNo,
            labelStyle: Theme.of(context).textTheme.titleLarge,
            prefixIcon: const Icon(Iconsax.call),
          ),
        ),
            
        // password
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: TTexts.password,
            labelStyle: Theme.of(context).textTheme.titleLarge,
            prefixIcon: Icon(Iconsax.scanner),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
            
        // agree term
        TTermAndConditionCheckBox(),
        // create account button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(TTexts.createAccount),
          ),
        ),
      ],
    );
  }
}

