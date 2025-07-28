import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TFullScreenLoader {
  static void openLoadingDialog() {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.light,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: CircularProgressIndicator(color: TColors.primary),
          ),
        ),
      ),
    );
  }

  static void stopLoadingDialog() => Navigator.pop(Get.overlayContext!);
}
