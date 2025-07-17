import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
    this.textStyle,
  });

  final String title;
  final int maxLines;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle ?? Theme.of(context).textTheme.labelLarge,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
