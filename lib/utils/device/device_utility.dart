import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Lớp tiện ích cung cấp các phương thức hỗ trợ cho thiết bị và UI
class TDeviceUtils {
  
  /// Ẩn bàn phím ảo bằng cách chuyển focus sang một FocusNode trống
  /// [context] - BuildContext của widget hiện tại
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// Thiết lập màu cho thanh trạng thái (status bar)
  /// [color] - Màu muốn thiết lập cho status bar
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color)
    );
  }

  /// Kiểm tra xem thiết bị có đang ở chế độ ngang (landscape) không
  /// [context] - BuildContext để lấy thông tin viewInsets
  /// Trả về true nếu keyboard không hiển thị (bottom inset = 0)
  /// Note: Logic này có vẻ không chính xác, nên dùng MediaQuery.of(context).orientation
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// Kiểm tra xem thiết bị có đang ở chế độ dọc (portrait) không
  /// [context] - BuildContext để lấy thông tin viewInsets
  /// Trả về true nếu keyboard đang hiển thị (bottom inset != 0)
  /// Note: Logic này có vẻ không chính xác, nên dùng MediaQuery.of(context).orientation
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  /// Thiết lập chế độ toàn màn hình
  /// [enable] - true để bật fullscreen, false để tắt
  /// immersiveSticky: ẩn hoàn toàn system UI, hiện lại khi swipe
  /// edgeToEdge: hiển thị system UI với nền trong suốt
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  /// Lấy chiều cao của màn hình
  /// [context] - BuildContext để truy cập MediaQuery
  /// Trả về chiều cao màn hình tính bằng logical pixels
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Lấy chiều rộng của màn hình
  /// [context] - BuildContext để truy cập MediaQuery
  /// Trả về chiều rộng màn hình tính bằng logical pixels
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Lấy tỷ lệ pixel của thiết bị (device pixel ratio)
  /// [context] - BuildContext để truy cập MediaQuery
  /// Trả về tỷ lệ giữa physical pixels và logical pixels
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  /// Lấy chiều cao của thanh trạng thái (status bar)
  /// [context] - BuildContext để truy cập MediaQuery
  /// Trả về chiều cao status bar tính bằng logical pixels
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Lấy chiều cao mặc định của thanh điều hướng dưới (bottom navigation bar)
  /// Trả về hằng số kBottomNavigationBarHeight từ Material Design
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// Lấy chiều cao mặc định của thanh ứng dụng (app bar)
  /// Trả về hằng số kToolbarHeight từ Material Design
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// Lấy chiều cao của bàn phím ảo
  /// [context] - BuildContext để truy cập MediaQuery
  /// Trả về chiều cao bàn phím, = 0 nếu bàn phím không hiển thị
  static double getKeyboardHeight(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom;
  }

  /// Kiểm tra xem bàn phím có đang hiển thị không
  /// [context] - BuildContext để truy cập MediaQuery
  /// Trả về true nếu bàn phím đang hiển thị (bottom inset > 0)
  static Future<bool> isKeyboardVisible(BuildContext context) async {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom > 0;
  }

  /// Kiểm tra xem ứng dụng có đang chạy trên thiết bị thật không
  /// Trả về true nếu chạy trên Android hoặc iOS
  /// Note: Logic này không chính xác, emulator cũng trả về true
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// Tạo rung động (vibration) cho thiết bị
  /// [duration] - Thời gian rung động
  /// Note: HapticFeedback.vibrate() không nhận tham số duration
  /// Logic hiện tại sẽ rung 2 lần với khoảng cách = duration
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// Thiết lập hướng màn hình ưu tiên cho ứng dụng
  /// [orientations] - Danh sách các hướng được phép
  /// Ví dụ: [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Ẩn thanh trạng thái (status bar)
  /// Sử dụng SystemUiMode.manual với overlays rỗng
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// Hiển thị thanh trạng thái (status bar)
  /// Sử dụng SystemUiMode.manual với tất cả overlays
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  /// Kiểm tra kết nối internet
  /// Thử lookup DNS cho 'example.com'
  /// Trả về true nếu có kết nối internet
  /// Note: Logic kiểm tra result[0].rawAddress.isEmpty có vẻ không chính xác
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty; // Sửa lại logic
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Kiểm tra xem thiết bị có phải là iOS không
  /// Trả về true nếu đang chạy trên iOS
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Kiểm tra xem thiết bị có phải là Android không
  /// Trả về true nếu đang chạy trên Android
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  /// Mở URL trong trình duyệt hoặc ứng dụng tương ứng
  /// [url] - URL cần mở
  /// Throws exception nếu không thể mở URL
  static void launchUrl(String url) async {
    if(await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "Could not launch $url";
    }
  }
}