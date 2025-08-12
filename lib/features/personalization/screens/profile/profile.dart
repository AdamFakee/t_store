import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/shimmers/profile_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/personalization/controllers/profile_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/l10n/app_localizations.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Obx(() {
      // show loading
      if (controller.loading.value) {
        return TProfileShimmer();
      }

      // Core UI
      return Scaffold(
        appBar: TAppBar(
          title: Text(
            TLanguage.of(context)?.profile ?? "",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackButton: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // avatar
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: TSizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        TRoundedImage(
                          imageUrl: TImage.categoryIcon,
                          isNeworkImage: true,
                          width: 66,
                          height: 66,
                          radius: TSizes.all,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(TLanguage.of(context)?.changeProfilePicture ?? ""),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),

                /// --Profile Infomation
                SizedBox(height: TSizes.spaceBtwItems),
                TSectionTextHeading(title: TLanguage.of(context)?.profileInfoTitle ?? ""),

                /// --Name
                TProfileMenu(
                  title: TLanguage.of(context)?.nameTitle ?? "",
                  value: controller.currentUser.fullName,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),
                /// --UserName
                TProfileMenu(
                  title: TLanguage.of(context)?.usernameTitle ?? "",
                  value: controller.currentUser.username,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),

                Divider(),

                /// --Personal Information
                SizedBox(height: TSizes.spaceBtwItems),
                TSectionTextHeading(title: TLanguage.of(context)?.personalInfoTitle ?? ""),
                /// --User Id
                TProfileMenu(
                  title: TLanguage.of(context)?.userIdTitle ?? "",
                  value: controller.currentUser.id,
                  onPressed: () {
                    /// --Press to copy UserId
                    Clipboard.setData(ClipboardData(text: controller.currentUser.id));

                    /// --Show alter
                    TSnackBar.successSnackBar(title: "Success", message: "Copy to clipboard");
                  },
                  icon: Iconsax.copy,
                ),
                /// --Email
                TProfileMenu(
                  title: TLanguage.of(context)?.emailTitle ?? "",
                  value: controller.currentUser.email,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),
                /// --Phone 
                TProfileMenu(
                  title: TLanguage.of(context)?.phoneNumberTitle ?? "",
                  value: controller.currentUser.phoneNumber,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),
                /// --gender (fixed)
                TProfileMenu(
                  title: TLanguage.of(context)?.genderTitle ?? "",
                  value: TTexts.genderValue,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),
                /// --date of birth (fixed)
                TProfileMenu(
                  title: TLanguage.of(context)?.dobTitle ?? "",
                  value: TTexts.dobValue,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),

                Divider(),

                /// --Close Account (logout)
                SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: TextButton(
                    onPressed: () {
                      controller.logout();
                    },
                    child: Text(
                      TLanguage.of(context)?.closeAccount ?? "",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.apply(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
