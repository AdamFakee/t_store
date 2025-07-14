import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor = TColors.white,
    required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: Icon(Iconsax.shopping_bag, color: TColors.white),
          onPressed: onPressed,
        ),
        Positioned(
          top: -8,
          right: -8,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: TColors.black,
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: iconColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
