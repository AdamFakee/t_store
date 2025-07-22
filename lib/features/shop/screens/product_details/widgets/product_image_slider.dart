import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';


class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// --Main Large Image (showing)
        TRoundedImage(
          height: TSizes.headerContainerHome,
          width: double.infinity,
          fit: BoxFit.cover,
          imageUrl: TImage.shoeSnaker,
          isNeworkImage: true,
          radius: 0,
        ),
    
        /// --Images slider (can choose)
        Positioned(
          left: 30,
          bottom: 30,
          child: SizedBox(
            height: TSizes.imageSliderSize,
            width: THelperFunctions.screenWidth(context) - 30,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) => TRoundedImage(
                imageUrl: TImage.tShirt,
                isNeworkImage: true,
                width: TSizes.imageSliderSize,
                fit: BoxFit.cover,
                border: Border.all(color: TColors.buttonPrimary),
              ),
              separatorBuilder: (_, __) => SizedBox(width: TSizes.md),
              itemCount: 6,
              physics: AlwaysScrollableScrollPhysics(),
            ),
          ),
        ),
    
        /// --Header
        TAppBar(
          showBackButton: true,
          actions: [
            TCircularIcon(iconColor: Colors.red, icon: Iconsax.heart),
          ],
        ),
      ],
    );
  }
}
