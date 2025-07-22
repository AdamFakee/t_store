import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductRatingAndSharing extends StatelessWidget {
  const TProductRatingAndSharing({super.key});

  @override
  Widget build(BuildContext context) {
    return
    /// --Rating & share
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Iconsax.star5, color: Colors.amberAccent, size: TSizes.lg),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "5.0",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: " (200) ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),

        IconButton(onPressed: () {}, icon: Icon(Icons.share)),
      ],
    );
  }
}
