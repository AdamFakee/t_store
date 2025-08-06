import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/loadings/circular_full_screen_loading.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/screens/addresses/add_new_address.dart';
import 'package:t_store/features/personalization/screens/addresses/widgets/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class Addresses extends StatelessWidget {
  const Addresses({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Obx(
      () {
        if(controller.loading.value) {
          return TCircularFullScreenLoading();
        }

        return Scaffold(
        floatingActionButton: TRoundedContainer(
          onTap: () => Get.to(() => AddNewAddress()),
          height: 50,
          width: 50, 
          radius: TSizes.md,
          backgroundColor: TColors.primary,
          child: Icon(Icons.add, color: TColors.white,),
        ),
        appBar: TAppBar(
          title: Text(
            TTexts.address,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackButton: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: TSizes.md,
            vertical: TSizes.lg,
          ),
          child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.addresses.length,
                separatorBuilder: (_, __) => SizedBox(height: TSizes.md),
                itemBuilder: (_, index) {
                  final address = controller.addresses[index];
                  return SizedBox(child: TSingleAddress(address: address));
                },
              )
        ),
      );
      }
    );
  }
}
