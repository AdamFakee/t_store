import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSettingMenuTile extends StatelessWidget {
  const TSettingMenuTile({super.key, required this.title, required this.subTitle, required this.icon, this.onTap});

  final String title, subTitle;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: isDarkMode ?TColors.white : TColors.black),
      title: Text(title),
      subtitle: Text(subTitle),
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      subtitleTextStyle: Theme.of(context).textTheme.labelMedium,
    );
  }
}