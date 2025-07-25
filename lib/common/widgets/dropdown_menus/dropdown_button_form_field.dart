import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/input_borders.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TDropdownButtonFormField extends StatelessWidget {
  const TDropdownButtonFormField({
    super.key, required this.listOptions, required this.onChange, this.defaultValue,
  });

  final List<String> listOptions;
  final void Function(String value) onChange;

  /// if null => defaultValue = listOptions[0]
  final String? defaultValue;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return DropdownButtonFormField<String>(
      dropdownColor: isDarkMode ? TColors.black : TColors.softGrey,
      borderRadius: BorderRadius.circular(4),
      decoration: InputDecoration(
        prefixIcon: Icon(Iconsax.sort),
        prefixIconColor: TColors.black,
        border: TInputBordersStyle.dropDownMenu,
        enabledBorder: TInputBordersStyle.dropDownMenu,
        focusedBorder: TInputBordersStyle.dropDownMenu
      ),
      value: defaultValue ?? listOptions[0], 
      items: listOptions.map((
        String value,
      ) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

      /// Không gán thẳng onChange vào vì sau này muốn chỉnh kiểu dữ liệu của [listOptions] thì vẫn chỉ cần chỉ value.[x...] để truyền vào thôi 
      /// 
      /// Chắc là tối ưu chút
      onChanged: (value) {
        if(value != null) {
          onChange(value);
        }
      },
    );
  }
}
