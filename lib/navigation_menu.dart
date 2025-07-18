import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // đang lỗi darkmode ở đây => isDarkMode = false dù thay đổi hay k :::::::: ERROR
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationControler());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          onDestinationSelected: (index) => controller.navigationTo(index),
          selectedIndex: controller.selectedIndex.value,
          elevation: 0,
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(color: isDarkMode ? TColors.white : TColors.black),
          ),
          backgroundColor: isDarkMode ? TColors.black : Colors.white,
          indicatorColor: isDarkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: [
            TNavigationDestination(icon: Iconsax.home, label: TTexts.home),
            TNavigationDestination(icon: Iconsax.shop, label: TTexts.store),
            TNavigationDestination(icon: Iconsax.heart, label: TTexts.withList),
            TNavigationDestination(icon: Iconsax.user, label: TTexts.profile),
          ],
        ),
      ),
      body: Obx(() => controller.screen(),),
    );
  }
}

class TNavigationDestination extends StatelessWidget {
  final String label;
  final IconData icon;
  const TNavigationDestination({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return NavigationDestination(
      icon: Icon(icon, color: isDarkMode ? TColors.white : TColors.black),
      label: label,
    );
  }
}

class NavigationControler extends GetxController {
  final selectedIndex = 0.obs;
  
  Widget screen() {
    switch (selectedIndex.value) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Store();
      case 2:
        return Container(color: Colors.green,);
      case 3:
        return Container(color: Colors.blue,);
      
      // default = case 0
      default:
        return const HomeScreen();
    }
  }

  void navigationTo(index) {
    // k cần check cũng được, vì bên getx còn cơ chế check depedency nữa
    if (index == selectedIndex.value) return;
    selectedIndex.value = index;
  }
}
