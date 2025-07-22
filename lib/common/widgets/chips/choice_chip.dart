import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    final bool isColor = THelperFunctions.getColor(text) != null;
    return ChoiceChip(
      selected: selected,
      onSelected: onSelected,
      label: isColor ? const SizedBox() : Text(text),
      labelStyle: TextStyle(color: selected ? Colors.white : null),
      labelPadding: isColor ? EdgeInsets.all(0) : null,
      selectedColor: isColor ? THelperFunctions.getColor(text) : null,
      disabledColor: isColor ? THelperFunctions.getColor(text) : null,
      padding: isColor ? EdgeInsets.all(0) : null,
      shape: isColor ? const CircleBorder() : null,
      avatar: isColor ? TRoundedContainer(
        width: 50,
        height: 50,
        backgroundColor: THelperFunctions.getColor(text)!,
      ) : null,
    );
  }
}
