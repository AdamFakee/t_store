import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: TSizes.spaceBtwItems,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(TImage.google, width: TSizes.iconMd, height: TSizes.iconMd,),
          ),
        ),
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
