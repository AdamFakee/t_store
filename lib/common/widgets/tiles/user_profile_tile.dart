import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/image_radius.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.userName,
    required this.contact,
    required this.imageUrl,
    required this.onTap,
  });

  final String userName, contact;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: TRoundedImage(
        imageUrl: imageUrl,
        isNeworkImage: true,
        radius: TSizes.all,
      ),
      title: Text(userName),
      subtitle: Text(contact),
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      subtitleTextStyle: Theme.of(context).textTheme.labelMedium,
      trailing: Icon(Iconsax.edit, color: TColors.white),
    );
  }
}
