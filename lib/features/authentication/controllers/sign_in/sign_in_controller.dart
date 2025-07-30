import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/get_storage_key.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class SignInController extends GetxController {
  static SignInController get instace => Get.find();

  @override
  void onInit() {
    super.onInit();
    // assign email & password by value in localstorage (save in remember me)
    email.text = localStorage.read(TGetStorageKey.rememberMeEmail);
    password.text = localStorage.read(TGetStorageKey.rememberMePassword);
  }

  // variables
  RxBool loading = false.obs; // state manage loading popup
  RxBool hidePassword = true.obs; // state manage show or hidden password in textFormField
  RxBool rememberMe = true.obs; 

  final _authRepo = AuthenticationRepository.instance;
  final _userController = Get.put(UserController());
 
  // controller variables
  final localStorage = GetStorage();
  final email = TextEditingController(); // email text edit controller
  final password = TextEditingController(); // password text edit controller

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();


  /// Function signin with email & password throw firebase auth
  void signInWithEmailAndPassword () async {
    try {
      // show loading
      TFullScreenLoader.openLoadingDialog();
      
      /// Checking internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected == false) {
        // close loading
        TFullScreenLoader.stopLoadingDialog();

        // show alter
        TSnackBar.errorSnackBar(
          title: TTexts.noInternetTitle,
          message: TTexts.noInternetMessage,
        );
        return;
      }

      // validations
      if(signInFormKey.currentState!.validate() == false) {
        // close loading
        TFullScreenLoader.stopLoadingDialog();
        return;
      }

      // User signIn to the firebase authentication
      await _authRepo.signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remember me
      // login successfull => pass & email is valid => time to save
      if(rememberMe.value) {
        localStorage.write(TGetStorageKey.rememberMeEmail, email.text.trim());
        localStorage.write(TGetStorageKey.rememberMePassword, password.text.trim());
      }

      // redirect
      _authRepo.screenRedirect();
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      loading.value = false;
    }
  }

  /// Function signin with google
  void signInWithGoogle () async {
    print('Current route 11: ${Get.currentRoute}');
    print('Previous route 11: ${Get.previousRoute}');
    try {
      // show loading
      TFullScreenLoader.openLoadingDialog();

      // User signIn to the firebase authentication
      final userCredential = await _authRepo.signInWithGoogle();

      if (userCredential == null) {
        TFullScreenLoader.stopLoadingDialog();
        return;
      }

      // save user record to firebase
      _userController.saveUserRecord(userCredential);

      // stop loading
      //
      // không đặt [stopLoadingDialog] ở finally bởi vì khi gọi đến [_authRepo.screenRedirect] => clear hết các route có trong navigation stack (get.offAll) 
      // nhưng vẫn đang tham chiếu tới dialog => stop dialog lỗi (xoá lỗi)
      TFullScreenLoader.stopLoadingDialog();
      
      // Show success message
      TSnackBar.successSnackBar(
        title: "Welcome!", 
        message: "You have successfully signed in with Google"
      );

      // redirect
      _authRepo.screenRedirect();
    } catch (e) {
      // stop loading
      TFullScreenLoader.stopLoadingDialog();

      // show alter
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    }
  }
}