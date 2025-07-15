import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';


class TSectionTextHeading extends StatelessWidget {
  const TSectionTextHeading({
    super.key, 
    required this.title, 
    this.actionTitle,  
    this.onTap,
  });

  final String title;
  final String? actionTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // title
        Text(
          title, 
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.light)
        ),
        // button
        actionTitle != null ? 
          TextButton(
            onPressed: onTap, 
            child: Text(
              actionTitle!, 
              style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.light)
            )
          ) : 
          const SizedBox.shrink() // trả về 1 box vô hình
      ],
    );
  }
}

