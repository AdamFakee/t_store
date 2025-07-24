import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';


class TOrderCardTile extends StatelessWidget {
  const TOrderCardTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isStatusTile = false,
    required this.icon,
  });

  final String title, subtitle;
  final IconData icon;
  final bool isStatusTile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(
        title,
        style: isStatusTile
            ? Theme.of(
                context,
              ).textTheme.titleMedium!.apply(color: TColors.primary)
            : Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: TColors.darkGrey),
      ),
      subtitle: Text(
        subtitle,
        style: isStatusTile
            ? Theme.of(context).textTheme.titleLarge
            : Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
