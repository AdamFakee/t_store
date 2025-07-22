import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TReadmoreText extends StatelessWidget {
  const TReadmoreText({
    super.key, 
    required this.text, 
    this.trimLines = 3
  });

  final String text;
  final int trimLines;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimMode: TrimMode.Line,
      trimLines: trimLines,
      trimCollapsedText: TTexts.showMore,
      trimExpandedText: TTexts.showLess,
      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
