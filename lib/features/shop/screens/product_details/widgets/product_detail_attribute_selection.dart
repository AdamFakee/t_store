import 'package:flutter/widgets.dart';
import 'package:t_store/common/widgets/chips/choice_chip.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TProductDetailAttributesSelection extends StatelessWidget {
  const TProductDetailAttributesSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// --Colors selection
        Wrap(
          children: [
            /// --Heading
            TSectionTextHeading(title: TTexts.color),

            /// --Options
            TChoiceChip(selected: false, text: "Green",),
            TChoiceChip(selected: true, text: "Green",),
            TChoiceChip(selected: true, text: "Red",),
            TChoiceChip(selected: false, text: "Red",),
            TChoiceChip(selected: true, text: "Blue",),
            TChoiceChip(selected: false, text: "Pink",)
          ],
        ),

        /// --Sizes selection
        Wrap(
          spacing: TSizes.sm,
          runSpacing: TSizes.sm,
          children: [
            /// --Heading
            TSectionTextHeading(title: TTexts.size),

            /// --Options
            TChoiceChip(selected: false, text: "EU 34",),
            TChoiceChip(selected: true, text: "EU 36",),
            TChoiceChip(selected: true, text: "EU 37",),
            TChoiceChip(selected: false, text: "EU 90",),
            TChoiceChip(selected: true, text: "EU 80",),
            TChoiceChip(selected: false, text: "EU 90",)
          ],
        )
      ],
    );
  }
}