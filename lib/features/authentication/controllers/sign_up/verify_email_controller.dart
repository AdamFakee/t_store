import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance; // firebase auth
  // Send Eamil Whener verify screen appears & Set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimeForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  void sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();

      // show alter
      TSnackBar.successSnackBar(
        title: TTexts.emailSentTitle,
        message: TTexts.emailSentMessage,
      );
    } catch (e) {
      // show alter
      TSnackBar.errorSnackBar(title: "Oh snap", message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  void setTimeForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      // reload user to check verification status
      await _auth.currentUser?.reload();

      final user = _auth.currentUser;
      if (user != null && user.emailVerified) {
        // remove timer
        timer.cancel();

        // redirect to relevant screen
        Get.offAll(
          () => TSuccessScreen(
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            image: TImage.createAccountSuccess,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// Manually check if email verified
  void checkEmailVerification() async {
    final currentUser = _auth.currentUser;
    
    if (currentUser != null && currentUser.emailVerified) {
      // redirect to relevant screen
      Get.offAll(
        () => TSuccessScreen(
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          image: TImage.createAccountSuccess,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
