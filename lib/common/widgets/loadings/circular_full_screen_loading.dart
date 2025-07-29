import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCircularFullScreenLoading extends StatelessWidget {
  const TCircularFullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TColors.primary,
      body: Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
