import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';


class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key, required this.title, required this.value, required this.onPressed, required this.icon,
  });

  final String title, value;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.apply(color: TColors.darkGrey),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: TSizes.sm),
              child: Icon(icon, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
