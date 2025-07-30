import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/features/authentication/screens/login/login_screen.dart';
import 'package:t_store/features/authentication/screens/onboarding_screen/onboarding.dart';
import 'package:t_store/features/authentication/screens/register_screen/verify_email.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/get_storage_key.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exception.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Không dùng onInit vì onInit chỉ dùng để khởi tạo controller, các thông tin trong onInit được đặt trong [widget/controller]
  ///
  /// Sử dụng onReady bởi vì sau khi onInit khởi tạo xong các widget (nghĩa là widget được render xong) => [screenRedirect] mới có thể điều hướng tới màn hình cụ thể
  /// 
  /// Được khởi tạo ở file : main.dart
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();

    super.onReady();
  }

  /// Function to show relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      // check user verified email exist
      if (user.emailVerified) {
        return Get.offAll(() => NavigationMenu());
      } else {
        return Get.offAll(() => VerifyEmailScreen());
      }
    } else {
      /// Hàm chỉ lưu giá trị nếu [key] chưa tồn tại
      ///
      /// Nghĩa là chỉ lưu giá trị cho những người dùng lần đầu vào app
      deviceStorage.writeIfNull(TGetStorageKey.isFisrtTime, true);

      /// Đã vào app ít nhất 1 lần => không hiển thị [OnBoardingScreen] nữa
      deviceStorage.read(TGetStorageKey.isFisrtTime) != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
    }
  }

  /* ----------------- Email & password ------------------------- */

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw TTexts.somethingWentWrong;
    }
  }

  /// [EmailAuthentication] - Mail verification
  Future<void> sendEmailVerification () async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw TTexts.somethingWentWrong;
    }
  }

  /// [EmailAuthentication] - Login
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw TTexts.somethingWentWrong;
    }
  }
  /* ----------------- End Email & password ------------------------- */

  /* ------------------ Socials ------------------------------------- */

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      // show popup to choose email account
      // [userAccount] contain infor of email account (email, avatar, id, name)
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      
      // check [userAccount] = null
      if(userAccount == null) return null;

      // take accessToken, idToken for account auth
      final GoogleSignInAuthentication googleAuth = await userAccount.authentication;
      

      final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      // signIn with firebase & return userCredential
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw TTexts.somethingWentWrong;
    }
  }
  /* ------------------ End Socials --------------------------------- */

  /// [logoutUser] - Valid for any authentication
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw TTexts.somethingWentWrong;
    }
  }
}
