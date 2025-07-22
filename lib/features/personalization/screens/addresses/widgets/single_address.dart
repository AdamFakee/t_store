import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: isSelected ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      child: Stack(
        children: [
          if(isSelected) 
            Positioned(
              right: 0,
              child: Icon(Iconsax.tick_circle5, color: isDarkMode ? TColors.white : TColors.black,),
            )
          ,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --Reciver name
              Text(TTexts.myName, style: Theme.of(context).textTheme.titleLarge,),
              /// --Phone
              Text(TTexts.phoneNo, style: Theme.of(context).textTheme.titleSmall,),
              /// --Home address
              Text(TTexts.homeAddress, style: Theme.of(context).textTheme.titleSmall,),
            ],
          ),
        ],
      ),
    );
  }
}