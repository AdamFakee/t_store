import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class SettingController extends GetxController{
  static SettingController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    _loadCurrentUser();
  }
  // Variables
  RxBool loading = false.obs;
  late final UserModel _currentUser;
  final UserRepository userRepo = UserRepository.instance;

  UserModel get currentUser => _currentUser;

  /// Function assign value for _currentUser
  void _loadCurrentUser() async {
    try {
      // start loading
      loading.value = true;
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }
}