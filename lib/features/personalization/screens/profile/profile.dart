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
            TTexts.profile,
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
                          child: Text(TTexts.changeProfilePicture),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),

                /// --Profile Infomation
                SizedBox(height: TSizes.spaceBtwItems),
                TSectionTextHeading(title: TTexts.profileInfoTitle),

                /// --Name
                TProfileMenu(
                  title: TTexts.nameTitle,
                  value: controller.currentUser.fullName,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),
                /// --UserName
                TProfileMenu(
                  title: TTexts.usernameTitle,
                  value: controller.currentUser.username,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),

                Divider(),

                /// --Personal Information
                SizedBox(height: TSizes.spaceBtwItems),
                TSectionTextHeading(title: TTexts.personalInfoTitle),
                /// --User Id
                TProfileMenu(
                  title: TTexts.userIdTitle,
                  value: controller.currentUser.id,
                  onPressed: () {
                    /// --Press to copy UserId
                    Clipboard.setData(ClipboardData(text: TTexts.userIdValue));

                    /// --Show alter
                    TSnackBar.successSnackBar(title: "Success", message: "Copy to clipboard");
                  },
                  icon: Iconsax.copy,
                ),
                /// --Email
                TProfileMenu(
                  title: TTexts.emailTitle,
                  value: controller.currentUser.email,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),
                /// --Phone 
                TProfileMenu(
                  title: TTexts.phoneNumberTitle,
                  value: controller.currentUser.phoneNumber,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),
                /// --gender (fixed)
                TProfileMenu(
                  title: TTexts.genderTitle,
                  value: TTexts.genderValue,
                  onPressed: () {},
                  icon: Iconsax.arrow_right_34,
                ),
                /// --date of birth (fixed)
                TProfileMenu(
                  title: TTexts.dobTitle,
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
                      TTexts.closeAccount,
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
