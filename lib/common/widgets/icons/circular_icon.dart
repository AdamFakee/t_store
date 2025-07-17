import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  /// A custom circular icon widget with bg-color
  ///
  /// properties are:
  /// container [width], [height] & [backgroundColor]
  ///
  /// Icon [size], [color] & [onpressed]
  const TCircularIcon({
    super.key,
    this.width = 30,
    this.height = 30,
    this.size = 15,
    this.backroundColor,
    required this.iconColor,
    required this.icon, 
    this.onPressed,
  });

  final double width, height, size;
  final Color? backroundColor;
  final Color iconColor;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return TCircularContainer(
      width: width,
      height: height,
      backgroundColor: backroundColor ?? (isDarkMode ? TColors.black.withOpacity(0.9) : TColors.white.withOpacity(0.9)) ,
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: iconColor, size: size)),
    );
  }
}
