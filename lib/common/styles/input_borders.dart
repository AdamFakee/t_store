import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TInputBordersStyle {
  static final OutlineInputBorder  dropDownMenu = OutlineInputBorder(
    borderRadius: BorderRadius.circular(TSizes.sm),
    borderSide: BorderSide(
      width: 2, 
      color: TColors.black,
    ),
  );
}
