import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductTextRich extends StatelessWidget {
  const TProductTextRich({
    super.key,
    required this.prefixTitle,
    required this.title,
  });

  final String prefixTitle;
  final String title;
  final String seperator = ": ";
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: 14,
          color: TColors.darkGrey
        ),
        text: prefixTitle + seperator,
        children: [TextSpan(text: title, style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isDarkMode ? TColors.white : TColors.black
        ))],
      ),
    );
  }
}
