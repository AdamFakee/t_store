import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.isNeworkImage = false,
    required this.imageUrl,
    this.width,
    this.height,
    this.padding,
    this.border,
    this.applyImageRadius = true,
    this.radius = TSizes.md,
    this.onPressed,
    this.fit = BoxFit.contain
  });

  final bool isNeworkImage;
  final String imageUrl;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final bool applyImageRadius;
  final double radius;
  final BoxFit fit;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: border,
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadiusGeometry.circular(radius)
              : BorderRadiusGeometry.circular(0),
          child: Image(
            image: isNeworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl),
            fit: fit
          ),
        ),
      ),
    );
  }
}
