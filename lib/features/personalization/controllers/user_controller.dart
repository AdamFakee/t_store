import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // variables
  final _userRepo = UserRepository.instance;

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      final user = userCredential.user;
      final displayName = user?.displayName;
      final nameParts = displayName != null ? UserModel.nameParts(displayName) : [];

      // convert [userCredential] 
      final userModel = UserModel(
        id: user!.uid,
        username: displayName != null ? UserModel.generateUsername(displayName) : "",
        email: user.email ?? "",
        firstName: nameParts.isNotEmpty ? nameParts[0] : "",
        lastName: nameParts.length > 1 ? nameParts[1] : "",
        phoneNumber: user.phoneNumber ?? "",
        profilePicture: user.photoURL ?? "",
      );

      // save user record to firebase store
      await _userRepo.saveUserRecord(userModel);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Data user not saved", message: e.toString());
    }
  }
}