import 'package:flutter/material.dart';

class TProductReivewTitleText extends StatelessWidget {
  const TProductReivewTitleText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontWeight: FontWeight.w500));
  }
}