import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // variables
  final _authRepo = AuthenticationRepository.instance;

  // form variables
  final TextEditingController email = TextEditingController(); // email controller in forget password email text input
  GlobalKey<FormState> forgetPasswordFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  /// Function to send given email for reseting password
  /// 
  /// [emailText] is a given email for [resend] reseting password email method if user want to resend this in other screen
  void resetPassword ({String? emailText}) async {
    try {
      // Start dialog loader
      TFullScreenLoader.openLoadingDialog();

      // Checking internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected == false) {
        TSnackBar.errorSnackBar(
          title: TTexts.noInternetTitle,
          message: TTexts.noInternetMessage,
        );
        return;
      }

      // check call [resetPassword] with given email
      if(emailText != null && emailText.isNotEmpty) {
        // firebase send reset password email 
        await _authRepo.sendPasswordResetEmail(emailText);
      } else {
        // Form validation
        if (forgetPasswordFormKey.currentState!.validate() == false) {
          // stop loading
          TFullScreenLoader.stopLoadingDialog();
          return;
        }

        // firebase send reset password email 
        await _authRepo.sendPasswordResetEmail(email.text);
      }

      // stop loading
      TFullScreenLoader.stopLoadingDialog();

      // Show success message
      TSnackBar.successSnackBar(
        title: "Successfully!", 
        message: "Check your email to reset password"
      );

      // redirect
      Get.offAll(() => TResetPassword(email: emailText ?? email.text,));

    } catch (e) {
      // stop loading
      TFullScreenLoader.stopLoadingDialog();

      // show alter
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    }
  }
}