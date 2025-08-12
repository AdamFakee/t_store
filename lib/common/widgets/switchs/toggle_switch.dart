import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:t_store/utils/constants/colors.dart';

class TToggleSwitch extends StatelessWidget {
  const TToggleSwitch({
    super.key,
    required this.value,
    this.width = 70,
    this.height = 35,
    this.valueFontSize = 12,
    this.toggleSize = 20,
    this.borderRadius = 30,
    this.padding = 6,
    this.inactiveText,
    this.activeText,
    this.showOnOff = true,
    required this.onToggle, 
    this.inactiveIcon, 
    this.activeIcon,
    this.activeColor = TColors.primary,
    this.inactiveColor = TColors.darkGrey
  });

  final bool value, showOnOff;
  final double width, height, valueFontSize, toggleSize, borderRadius, padding;
  final String? inactiveText, activeText;
  final Function(bool) onToggle;
  final Widget? inactiveIcon, activeIcon;
  final Color inactiveColor, activeColor;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: width,
      height: height,
      valueFontSize: valueFontSize,
      toggleSize: toggleSize,
      value: value,
      borderRadius: borderRadius,
      padding: padding,
      showOnOff: showOnOff,
      inactiveText: inactiveText,
      inactiveTextFontWeight: FontWeight.w600,
      inactiveIcon: inactiveIcon,
      inactiveColor: inactiveColor,
      activeText: activeText,
      activeIcon: activeIcon,
      activeTextFontWeight: FontWeight.w600,
      activeColor: activeColor,
      duration: Duration(milliseconds: 600),
      onToggle: (value) => onToggle(value),
    );
  }
}
