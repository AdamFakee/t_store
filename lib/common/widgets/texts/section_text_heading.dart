import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

/// a widget for title & buttonTitle in a row
/// Example: categories ----- viewAll
/// 
/// Properties:
/// [actionTitle] & [onTap] & [actionTitleColor] for buttonTitle
/// 
/// [title] & [titleColor] for title
class TSectionTextHeading extends StatelessWidget {
  const TSectionTextHeading({
    super.key, 
    required this.title, 
    this.actionTitle,  
    this.onTap,
    this.actionTitleColor,
    this.titleColor
  });

  final String title;
  final String? actionTitle;
  final VoidCallback? onTap;
  final Color? titleColor, actionTitleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // title
        Text(
          title, 
          style: titleColor != null ? Theme.of(context).textTheme.titleLarge!.apply(color: titleColor) : Theme.of(context).textTheme.titleLarge
        ),
        // button
        actionTitle != null ? 
          TextButton(
            onPressed: onTap, 
            child: Text(
              actionTitle!, 
              style: actionTitleColor != null ? Theme.of(context).textTheme.labelMedium!.apply(color: actionTitleColor,) : Theme.of(context).textTheme.labelMedium
            )
          ) : 
          const SizedBox.shrink() // trả về 1 box vô hình
      ],
    );
  }
}

