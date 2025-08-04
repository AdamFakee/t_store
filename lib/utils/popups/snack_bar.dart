import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

/// A class using to show snackBar
class TSnackBar {
  static customSnackBar({required String message, int duration = 3}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        duration: Duration(seconds: duration),
        content: Container(
          decoration: BoxDecoration(
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.darkGrey.withOpacity(0.9)
                : TColors.grey.withOpacity(0.9),
            borderRadius: BorderRadius.circular(TSizes.md),
          ),
          padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  static successSnackBar({
    required String title,
    String message = "",
    int duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TColors.white),
    );
  }

  static warningSnackBar({
    required String title,
    String message = "",
    int duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,

      /// Swipe to dimis
      shouldIconPulse: false,

      /// Hiệu ứng icon nhấp nháy
      colorText: TColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),

      /// thời gian hiển thị snack bar
      margin: EdgeInsets.all(10),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }

  static errorSnackBar({
    required String title,
    String message = "",
    int duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,

      /// Swipe to dimis
      shouldIconPulse: false,

      /// Hiệu ứng icon nhấp nháy
      colorText: TColors.white,
      backgroundColor: TColors.error,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),

      /// thời gian hiển thị snack bar
      margin: EdgeInsets.all(10),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }
}
