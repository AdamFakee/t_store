import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.address});

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: address.selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      child: Stack(
        children: [

          // checkbox
          Positioned(
            right: 0,
            child: Checkbox(value: address.selectedAddress, onChanged: (_) {
                controller.toggleSetDefaultAddress(address);
              }),
          )
          ,

          // body
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --Reciver name
              Text(address.name, style: Theme.of(context).textTheme.titleLarge,),
              /// --Phone
              Text(address.phoneNumber, style: Theme.of(context).textTheme.titleSmall,),
              /// --Home address
              Text(address.specificAddress, style: Theme.of(context).textTheme.titleSmall,),
            ],
          ),
        ],
      ),
    );
  }
}