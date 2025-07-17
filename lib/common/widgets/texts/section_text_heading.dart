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
    this.actionTitleColor = TColors.light,
    this.titleColor = TColors.light
  });

  final String title;
  final String? actionTitle;
  final VoidCallback? onTap;
  final Color titleColor, actionTitleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // title
        Text(
          title, 
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: titleColor)
        ),
        // button
        actionTitle != null ? 
          TextButton(
            onPressed: onTap, 
            child: Text(
              actionTitle!, 
              style: Theme.of(context).textTheme.labelMedium!.apply(color: actionTitleColor,)
            )
          ) : 
          const SizedBox.shrink() // trả về 1 box vô hình
      ],
    );
  }
}

