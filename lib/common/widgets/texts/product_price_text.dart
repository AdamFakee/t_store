import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.curencySign = '\$',
    required this.price,
    this.maxLines = 1,
    this.style,
  });

  final String curencySign;
  final String price;
  final int maxLines;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      curencySign + price,
      style: style ?? Theme.of(context).textTheme.headlineMedium,
      maxLines: maxLines,
    );
  }
}
