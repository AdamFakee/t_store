import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/loadings/circular_full_screen_loading.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/common/widgets/tiles/setting_menu_tile.dart';
import 'package:t_store/common/widgets/tiles/user_profile_tile.dart';
import 'package:t_store/features/personalization/controllers/setting_controller.dart';
import 'package:t_store/features/personalization/screens/addresses/addresses.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/personalization/screens/settings/custom_ui.dart';
import 'package:t_store/features/personalization/screens/settings/upload_data.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/features/shop/screens/orders/orders.dart';
import 'package:t_store/l10n/app_localizations.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    return Obx(() {
      // loading
      if (controller.loading.value) {
        return TCircularFullScreenLoading();
      }
      // Core Ui
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
                        TLanguage.of(context)?.account ?? "",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),

                    /// -- user information
                    TUserProfileTile(
                      userName: controller.currentUser.value?.username ?? "",
                      contact: controller.currentUser.value?.email ?? "",
                      imageUrl: TImage.categoryIcon,
                      onTap: () {
                        Get.to(Profile());
                      },
                    ),
                  ],
                ),
              ),

              // -- body
              Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// -- Account settings
                    TSectionTextHeading(title: TLanguage.of(context)?.accountSettings ?? ""),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// --Address
                    TSettingMenuTile(
                      title: TLanguage.of(context)?.myAddressesTitle ?? "",
                      subTitle: TLanguage.of(context)?.myAddressesSubTitle ?? "",
                      icon: Iconsax.safe_home,
                      onTap: () {
                        Get.to(() => Addresses());
                      },
                    ),

                    /// --Cart
                    TSettingMenuTile(
                      title: TLanguage.of(context)?.myCartTitle ?? "",
                      subTitle: TLanguage.of(context)?.myCartSubTitle ?? "",
                      icon: Iconsax.shopping_cart,
                      onTap: () {
                        Get.to(() => Cart());
                      },
                    ),

                    /// --Orders
                    TSettingMenuTile(
                      title: TLanguage.of(context)?.myOrdersTitle ?? "",
                      subTitle: TLanguage.of(context)?.myOrdersSubTitle ?? "",
                      icon: Iconsax.bag_tick,
                      onTap: () {
                        Get.to(() => Orders());
                      },
                    ),
                    TSettingMenuTile(
                      title: TLanguage.of(context)?.bankAccountTitle ?? "",
                      subTitle: TLanguage.of(context)?.bankAccountSubTitle ?? "",
                      icon: Iconsax.bank,
                    ),
                    TSettingMenuTile(
                      title: TLanguage.of(context)?.myCouponsTitle ?? "",
                      subTitle: TLanguage.of(context)?.myCouponsSubTitle ?? "",
                      icon: Iconsax.discount_shape,
                    ),
                    TSettingMenuTile(
                      title: TLanguage.of(context)?.notificationsTitle ?? "",
                      subTitle: TLanguage.of(context)?.notificationsSubTitle ?? "",
                      icon: Iconsax.notification,
                    ),
                    TSettingMenuTile(
                      title: TLanguage.of(context)?.accountPrivacyTitle ?? "",
                      subTitle: TLanguage.of(context)?.accountPrivacySubTitle ?? "",
                      icon: Iconsax.security_card,
                    ),

                    /// -- App Settings
                    SizedBox(height: TSizes.spaceBtwSections),
                    TSectionTextHeading(title: TLanguage.of(context)?.appSettings ?? ""),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // custom theme, language...
                    TSettingMenuTile(
                      title: "Customs",
                      subTitle: "Change theme, language.....",
                      icon: Iconsax.user_edit1,
                      onTap: () => Get.to(() => CustomUi()),
                    ),

                    // Upload dummy data to cloud
                    TSettingMenuTile(
                      title: TLanguage.of(context)?.loadDataTitle ?? "",
                      subTitle: TLanguage.of(context)?.loadDataSubTitle ?? "",
                      icon: Iconsax.document_upload,
                      onTap: () => Get.to(() => UploadDataScreen()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
