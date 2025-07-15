import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final Rx<int> currentIndex = 0.obs;

  void updateIndex (index) {
    currentIndex.value = index;
  }
}