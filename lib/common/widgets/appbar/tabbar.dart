import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';


class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If you want to add the bg-color to tabs, you have to wrap them in widget
  /// To do that, we need [PreferredSized] widget and that's why created custom class. 
  const TTabBar({
    super.key, required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return Material(
      color:  isDarkMode ? TColors.black : TColors.white,
      child: TabBar(
        unselectedLabelColor: TColors.darkGrey,
        labelColor: isDarkMode ? TColors.white : TColors.black,
        labelStyle: Theme.of(context).textTheme.titleLarge,
        indicatorColor: isDarkMode
            ? TColors.buttonPrimary
            : TColors.dark,
        isScrollable: true,
        tabs: tabs,
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
