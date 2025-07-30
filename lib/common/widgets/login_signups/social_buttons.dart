import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/sign_in/sign_in_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: TSizes.spaceBtwItems,
      children: [
        // google button
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: () {
              controller.signInWithGoogle();
            },
            icon: Image.asset(TImage.google, width: TSizes.iconMd, height: TSizes.iconMd,),
          ),
        ),
        // facebook button
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(TImage.facebook, width: TSizes.iconMd, height: TSizes.iconMd,),
          ),
        ),
      ],
    );
  }
}
