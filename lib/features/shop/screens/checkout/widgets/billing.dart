import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/shiping_address_section.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';


class TBilling extends StatelessWidget {
  const TBilling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      radius: TSizes.md,
      padding: EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: isDarkMode ? TColors.black : TColors.white,
      child: Column(
        spacing: TSizes.md,
        children: [
          /// --billing amount ( price, fee, shiping fee ...)
          TBillingAmountSection(),
    
          Divider(),
          /// --shipping address 
          TShippingAddressSection()
        ],
      ),
    );
  }
}