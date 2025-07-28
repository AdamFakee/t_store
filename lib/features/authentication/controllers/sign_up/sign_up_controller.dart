import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/features/authentication/screens/register_screen/verify_email.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/snack_bar.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final RxBool hidePassword = true.obs; // state hide password input
  final RxBool isAgreeTermAndCondition =
      false.obs; // state for agree term and policy

  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for lastName input
  final userName = TextEditingController(); // Controller for userName input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for firstName input
  final phoneNumber =
      TextEditingController(); // Controller for phoneNumber input

  GlobalKey<FormState> signUpFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  /// --Sign up
  Future<void> signUp() async {
    try {
      /// Start dialog loader
      TFullScreenLoader.openLoadingDialog();

      /// Checking internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected == false) {
        TSnackBar.errorSnackBar(
          title: TTexts.noInternetTitle,
          message: TTexts.noInternetMessage,
        );
        return;
      }

      /// Form validation
      if (signUpFormKey.currentState!.validate() == false) {
        return;
      }

      /// Agree privacy policy
      if (isAgreeTermAndCondition.value == false) {
        TSnackBar.warningSnackBar(
          title: TTexts.agreePrivacyPolicyTitle,
          message: TTexts.agreePrivacyPolicyMessage,
        );
        return;
      }

      /// Register user in the firebase authentication & save user data in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      /// Save authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: userName.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // stop loading
      TFullScreenLoader.stopLoadingDialog();

      // show success message
      TSnackBar.successSnackBar(title: "Congratulations", message: "Your account has been created! Verify email to continue");

      // Move to verify email screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // stop loading
      TFullScreenLoader.stopLoadingDialog();

      // show err
      TSnackBar.errorSnackBar(title: "Have an error", message: e.toString());
    }
  }
}
