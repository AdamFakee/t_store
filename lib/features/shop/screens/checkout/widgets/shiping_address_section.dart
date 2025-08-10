import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/modal_bottom_sheets/draggable_bottom_sheet.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/features/personalization/screens/addresses/widgets/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TShippingAddressSection extends StatelessWidget {
  const TShippingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());
    return Column(
      children: [
        TSectionTextHeading(
          title: TTexts.shippingAddress,
          actionTitle: TTexts.change,
          actionTitleColor: TColors.primary,
          onTap: () {
            TDraggableBottomSheet.show(
              context: context,
              child: Obx(
                () => Column(
                  spacing: TSizes.md,
                  children: addressController.addresses
                      .map((e) => SizedBox(
                        width: double.infinity,
                        child: TSingleAddress(address: e)))
                      .toList(),
                ),
              ),
            );
          },
        ),

        // selected address
        Obx(
          () {
            // have not defaut address
            if(addressController.selectedAddress.value == AddressModel.empty()) {
              return const SizedBox();
            }
            return Column(
              spacing: TSizes.spaceBtwItems / 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// --Reciver name
                Text(addressController.selectedAddress.value.name, style: Theme.of(context).textTheme.titleLarge),
            
                /// --Phone number
                Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.grey, size: 16),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Text(
                      addressController.selectedAddress.value.phoneNumber,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
            
                /// --Address
                Row(
                  children: [
                    const Icon(
                      Icons.location_history,
                      color: Colors.grey,
                      size: 16,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      child: Text(
                        addressController.selectedAddress.value.specificAddress,
                        style: Theme.of(context).textTheme.bodyMedium,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        ),
      ],
    );
  }
}
