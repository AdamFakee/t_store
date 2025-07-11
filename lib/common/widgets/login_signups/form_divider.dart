import 'package:flutter/material.dart';

class TFormDivider extends StatelessWidget {
  final String title;
  const TFormDivider({
    super.key, required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            indent: 60,
            thickness: 0.7,
            color: Colors.grey,
            endIndent: 5,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            indent: 5,
            thickness: 0.7,
            color: Colors.grey,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}