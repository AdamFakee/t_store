import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';

/// A class using to show snackBar 
class TSnackBar {
  static successSnackBar({
    required String title, String message = "",int duration = 3
  }) {
    Get.snackbar(
      title, message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TColors.white,)
    );
  }

  static warningSnackBar({
    required String title, String message = "",int duration = 3
  }) {
    Get.snackbar(
      title, message,
      isDismissible: true, /// Swipe to dimis
      shouldIconPulse: false, /// Hiệu ứng icon nhấp nháy
      colorText: TColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration), /// thời gian hiển thị snack bar
      margin: EdgeInsets.all(10),
      icon: const Icon(Iconsax.warning_2, color: TColors.white,)
    );
  }

  static errorSnackBar({
    required String title, String message = "",int duration = 3
  }) {
    Get.snackbar(
      title, message,
      isDismissible: true, /// Swipe to dimis
      shouldIconPulse: false, /// Hiệu ứng icon nhấp nháy
      colorText: TColors.white,
      backgroundColor: TColors.error,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration), /// thời gian hiển thị snack bar
      margin: EdgeInsets.all(10),
      icon: const Icon(Iconsax.warning_2, color: TColors.white,)
    );
  }
}