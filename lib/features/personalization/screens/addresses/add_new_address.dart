import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/l10n/app_localizations.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          TLanguage.of(context)?.addNewAddress ?? "",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.formKey,
          child: Column(
            spacing: TSizes.md,
            children: [
              /// --Name
              TextFormField(
                controller: controller.name,
                validator: (value) => TValidator.validateEmpty("Name", value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: TLanguage.of(context)?.name ?? "",
                ),
              ),
              /// --Phone number
              TextFormField(
                controller: controller.phoneNumber,
                validator: (value) => TValidator.validatePhoneNumber(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: TLanguage.of(context)?.phoneNumber ?? "",
                ),
              ),

              Row(
                spacing: TSizes.md,
                children: [
                  /// --Street
                  Expanded(
                    child: TextFormField(
                      controller: controller.street,
                      validator: (value) => TValidator.validateEmpty("Street", value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        labelText: TLanguage.of(context)?.street ?? "",
                      ),
                    ),
                  ),
                  /// --Postal code
                  Expanded(
                    child: TextFormField(
                      controller: controller.postalCode,
                      validator: (value) => TValidator.validateEmpty("Postal code", value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: TLanguage.of(context)?.postalCode ?? "",
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                spacing: TSizes.md,
                children: [
                  /// --City
                  Expanded(
                    child: TextFormField(
                      controller: controller.city,
                      validator: (value) => TValidator.validateEmpty("City", value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        labelText: TLanguage.of(context)?.city ?? "",
                      ),
                    ),
                  ),

                  /// --State
                  Expanded(
                    child: TextFormField(
                      controller: controller.state,
                      validator: (value) => TValidator.validateEmpty("State", value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        labelText: TLanguage.of(context)?.state ?? "",
                      ),
                    ),
                  ),
                ],
              ),

              /// --Country
              TextFormField(
                controller: controller.country,
                validator: (value) => TValidator.validateEmpty("Country", value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.global),
                  labelText: TLanguage.of(context)?.country ?? "",
                ),
              ),


              /// --Button save
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.createNewAddress();
                  }, 
                  child: Text(TLanguage.of(context)?.save ?? "")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
