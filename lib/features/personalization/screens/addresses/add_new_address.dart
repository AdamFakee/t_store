import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          TTexts.addNewAddress,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          child: Column(
            spacing: TSizes.md,
            children: [
              /// --Name
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: TTexts.name,
                ),
              ),
              /// --Phone number
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: TTexts.phoneNumber,
                ),
              ),

              Row(
                spacing: TSizes.md,
                children: [
                  /// --Street
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        labelText: TTexts.street,
                      ),
                    ),
                  ),
                  /// --Postal code
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: TTexts.postalCode,
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        labelText: TTexts.city,
                      ),
                    ),
                  ),

                  /// --State
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        labelText: TTexts.state,
                      ),
                    ),
                  ),
                ],
              ),

              /// --Country
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.global),
                  labelText: TTexts.country,
                ),
              ),


              /// --Button save
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text(TTexts.save)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
