import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/features/shop/screens/orders/widgets/order_card_tile.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TListOrderCards extends StatelessWidget {
  const TListOrderCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, _) => orderCard(),
      separatorBuilder: (_, _) => SizedBox(height: TSizes.spaceBtwItems),
      itemCount: 4,
    );
  }

  Widget orderCard() {
    return TRoundedContainer(
      padding: EdgeInsets.symmetric(
        horizontal: TSizes.md
      ),
      backgroundColor: TColors.darkGrey.withOpacity(0.2),
      child: Column(
        children: [
          /// order status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TOrderCardTile(
                  title: TTexts.processing,
                  subtitle: TTexts.dobValue,
                  icon: Icons.curtains_closed_outlined,
                  isStatusTile: true,
                ),
              ),

              Icon(Icons.arrow_forward_ios_sharp, size: TSizes.iconSm),
            ],
          ),

          /// --Order code & shipingDate
          Row(
            children: [
              Expanded(
                child: TOrderCardTile(
                  subtitle: "CWT0012",
                  title: TTexts.order,
                  icon: Icons.discount_outlined,
                ),
              ),
              Expanded(
                child: TOrderCardTile(
                  subtitle: TTexts.dobValue,
                  title: TTexts.shippingDate,
                  icon: Icons.date_range_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
