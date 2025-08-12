import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSettingMenuTile extends StatelessWidget {
  const TSettingMenuTile({super.key, required this.title,this.subTitle, this.icon, this.onTap, this.trailing, this.contentPadding});

  final String title;
  final String? subTitle;
  final IconData? icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return ListTile(
      onTap: onTap,
      contentPadding: contentPadding,
      minLeadingWidth: icon == null ? 0 : 8,
      leading: icon != null ? Icon(icon, color: isDarkMode ?TColors.white : TColors.black) : null,
      trailing: trailing,
      title: Text(title),
      subtitle: subTitle != null ? Text(subTitle!) : null,
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      subtitleTextStyle: Theme.of(context).textTheme.labelMedium,
    );
  }
}