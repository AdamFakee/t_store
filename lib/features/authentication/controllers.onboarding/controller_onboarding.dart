
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  // Tạo singleTon instance
  // init = Get.put(OnBoardingController)
  // gọi ở widget, screen khác: final cotroller = OnBoardingController.instace
  static OnBoardingController get instance => Get.find();

  Rx<int> currentPageIndex = 0.obs;
  final PageController pageController = PageController();

  // method chuyển trang mượt hơn
  void jumtToPageAnimation (int index) {
    pageController.animateToPage(
      index, 
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  void dotNavigatorClick (index) {
    currentPageIndex.value = index;
    jumtToPageAnimation(index);
  }

  void nextPage() {
    int index = currentPageIndex.value;
    if( index >= 2){
      // go to login
      print('go to login');
    } else {
      currentPageIndex.value++;
      jumtToPageAnimation(index + 1);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    jumtToPageAnimation(2);
  }
}