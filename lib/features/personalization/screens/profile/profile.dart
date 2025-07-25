import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(TTexts.profile, style: Theme.of(context).textTheme.headlineMedium),
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
                  padding: EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
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
              TProfileMenu(
                title: TTexts.nameTitle,
                value: TTexts.myName,
                onPressed: () {},
                icon: Iconsax.arrow_right_34
              ),
              TProfileMenu(
                title: TTexts.usernameTitle,
                value: TTexts.myName,
                onPressed: () {},
                icon: Iconsax.arrow_right_34
              ),

              Divider(),

              /// --Personal Information
              SizedBox(height: TSizes.spaceBtwItems),
              TSectionTextHeading(title: TTexts.personalInfoTitle),
              TProfileMenu(
                title: TTexts.userIdTitle,
                value: TTexts.userIdValue,
                onPressed: () {
                  /// --Press to copy UserId
                  Clipboard.setData(ClipboardData(text: TTexts.userIdValue));
                },
                icon: Iconsax.copy
              ),
              TProfileMenu(
                title: TTexts.emailTitle,
                value: TTexts.myEmailAddress,
                onPressed: () {},
                icon: Iconsax.arrow_right_34
              ),
              TProfileMenu(
                title: TTexts.phoneNumberTitle,
                value: TTexts.phoneNumberValue,
                onPressed: () {},
                icon: Iconsax.arrow_right_34
              ),
              TProfileMenu(
                title: TTexts.genderTitle,
                value: TTexts.genderValue,
                onPressed: () {},
                icon: Iconsax.arrow_right_34
              ),
              TProfileMenu(
                title: TTexts.dobTitle,
                value: TTexts.dobValue,
                onPressed: () {},
                icon: Iconsax.arrow_right_34
              ),

              Divider(),

              /// --Close Account
              SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(onPressed: (){}, child: Text(TTexts.closeAccount, style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.red),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

