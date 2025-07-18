import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TRoundedContainer extends StatelessWidget {
  /// a widget like TCircularContainer but don't require width, height
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.backgroundColor = TColors.white,
    this.child,
    this.radius = 20,
    this.padding,
    this.showBorder = false
  });

  final double? width;
  final double? height;
  final Color backgroundColor;
  final Widget? child;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(
          width: 1,
          color: TColors.darkGrey
        ) : null,
      ),
      child: child,
    );
  }
}
