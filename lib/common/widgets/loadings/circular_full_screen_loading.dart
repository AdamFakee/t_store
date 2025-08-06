import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCircularFullScreenLoading extends StatelessWidget {
  const TCircularFullScreenLoading({super.key});

  // không nên dùng scafold lồng nhau
    @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: TColors.primary,
      child: SizedBox.expand(
        child: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }

}
