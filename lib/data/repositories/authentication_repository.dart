import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login_screen.dart';
import 'package:t_store/features/authentication/screens/onboarding_screen/onboarding.dart';
import 'package:t_store/utils/constants/get_storage_key.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Không dùng onInit vì onInit chỉ dùng để khởi tạo controller, các thông tin trong onInit được đặt trong [widget/controller]
  /// 
  /// Sử dụng onReady bởi vì sau khi onInit khởi tạo xong các widget (nghĩa là widget được render xong) => [screenRedirect] mới có thể điều hướng tới màn hình cụ thể
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    
    super.onReady();
  }

  void screenRedirect () async {
    /// Hàm chỉ lưu giá trị nếu [key] chưa tồn tại
    /// 
    /// Nghĩa là chỉ lưu giá trị cho những người dùng lần đầu vào app
    deviceStorage.writeIfNull(TGetStorageKey.isFisrtTime, true);

    /// Đã vào app ít nhất 1 lần => không hiển thị [OnBoardingScreen] nữa
    deviceStorage.read(TGetStorageKey.isFisrtTime) != true ? Get.offAll(() => LoginScreen()) : Get.offAll(() => OnBoardingScreen());
  }
}
