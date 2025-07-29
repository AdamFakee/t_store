import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

/// A class show confirm popup (dialog)
class TConfirmPopup {
  /// Function onpen or show popup
  /// 
  /// When tap in "barrier area" return false
  static Future<bool> show({
    String title = "Are you sure?",
    String? content,
    String textConfirm = "Yes",
    String textCancel = "No"
  }) async {
    return await showDialog(
      context: Get.overlayContext!,
      builder: (context) {
        final bool isDarkMode = THelperFunctions.isDarkMode(context);
        return AlertDialog(
          backgroundColor: isDarkMode ? TColors.dark : TColors.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(TSizes.sm)
          ),
          // mặc định là 8px
          actionsPadding: EdgeInsets.only(left: TSizes.lg, right: TSizes.lg, top: 0, bottom: TSizes.lg),
          // mặc định là 24px
          contentPadding: EdgeInsetsGeometry.symmetric(
            horizontal: TSizes.lg,
            vertical: TSizes.sm
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          content: content != null ? Text(TTexts.loremText, style: Theme.of(context).textTheme.labelMedium,) : null,
          actions: [
            Row(
              spacing: TSizes.md,
              children: [
                // button confirm
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      close(true);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: TSizes.sm,
                        horizontal: TSizes.md,
                      ),
                    ),
                    child: Text(textConfirm),
                  ),
                ),

                // button cancle
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      close(false);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: TSizes.sm,
                        horizontal: TSizes.md,
                      ),
                    ),
                    child: Text(textCancel),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ) ?? false;
  }

  /// Function close popup and return [value]
  static void close(bool value) => Navigator.of(Get.context!).pop(value);
}
