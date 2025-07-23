import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TShippingAddressSection extends StatelessWidget {
  const TShippingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionTextHeading(
          title: TTexts.shippingAddress,
          actionTitle: TTexts.change,
          actionTitleColor: TColors.primary,
          onTap: () {},
        ),
        Column(
          spacing: TSizes.spaceBtwItems / 2,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --Reciver name
            Text(TTexts.myName, style: Theme.of(context).textTheme.titleLarge,),

            /// --Phone number
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.grey, size: 16),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(
                  '+92-317-8059525',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            /// --Address
            Row(
              children: [
                const Icon(Icons.location_history, color: Colors.grey, size: 16),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: Text(
                    'South Liana, Maine 87695, USA',
                    style: Theme.of(context).textTheme.bodyMedium,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
