import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/common/widgets/tiles/setting_menu_tile.dart';
import 'package:t_store/common/widgets/tiles/user_profile_tile.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- header
            TPrimaryHeaderContainer(
              height: TSizes.headerContainerProfile,
              child: Column(
                children: [
                  /// -- header title
                  TAppBar(
                    title: Text(
                      TTexts.account,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                  /// -- user information
                  TUserProfileTile(
                    userName: TTexts.myName,
                    contact: TTexts.myEmailAddress,
                    imageUrl: TImage.categoryIcon,
                    onTap: () {
                      Get.to(Profile());
                    },
                  ),
                ],
              ),
            ),

            // -- body
            Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account settings
                  TSectionTextHeading(title: TTexts.accountSettings),
                  SizedBox(height: TSizes.spaceBtwItems,),

                  TSettingMenuTile(title: TTexts.myAddressesTitle, subTitle: TTexts.myAddressesSubTitle, icon: Iconsax.safe_home),
                  TSettingMenuTile(title: TTexts.myCartTitle, subTitle: TTexts.myCartSubTitle, icon: Iconsax.shopping_cart),
                  TSettingMenuTile(title: TTexts.myOrdersTitle, subTitle: TTexts.myOrdersSubTitle, icon: Iconsax.bag_tick),
                  TSettingMenuTile(title: TTexts.bankAccountTitle, subTitle: TTexts.bankAccountSubTitle, icon: Iconsax.bank),
                  TSettingMenuTile(title: TTexts.myCouponsTitle, subTitle: TTexts.myCouponsSubTitle, icon: Iconsax.discount_shape),
                  TSettingMenuTile(title: TTexts.notificationsTitle, subTitle: TTexts.notificationsSubTitle, icon: Iconsax.notification),
                  TSettingMenuTile(title: TTexts.accountPrivacyTitle, subTitle: TTexts.accountPrivacySubTitle, icon: Iconsax.security_card),

                  /// -- App Settings
                  SizedBox(height: TSizes.spaceBtwSections,),
                  TSectionTextHeading(title: TTexts.appSettings),
                  SizedBox(height: TSizes.spaceBtwItems,),

                  TSettingMenuTile(title: TTexts.loadDataTitle, subTitle: TTexts.loadDataSubTitle, icon: Iconsax.document_upload),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
