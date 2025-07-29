import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/utils/popups/confirm_popup.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class ProfileController extends GetxController {
  static ProfileController get instace => Get.find();

  // variables
  RxBool loading = false.obs;
  late final UserModel _currentUser;
  final _userRepo = UserRepository.instance;
  final _authRepo = AuthenticationRepository.instance;

  @override
  void onInit() {
    _getUserInfor();
    super.onInit();
  }

  // getter
  UserModel get currentUser => _currentUser;

  /// Function get user information
  Future<void> _getUserInfor () async {
    try {
      // show loading
      loading.value = true;

      // get user infor
      _currentUser = await _userRepo.getUserInfor();
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      loading.value = false;
    }
  }

  /// Function logout
  void logout () async {
    try {
      // show confirm popup
      final bool confirm = await TConfirmPopup.show();
      if(confirm == false) return;
      
      // show loading
      loading.value = true;

      // get user infor
      await _authRepo.logout();

      // redirect relevant screen
      _authRepo.screenRedirect();
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      loading.value = false;
    }
  }
}