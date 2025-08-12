import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/switchs/toggle_switch.dart';
import 'package:t_store/common/widgets/tiles/setting_menu_tile.dart';
import 'package:t_store/features/personalization/controllers/custom_ui_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CustomUi extends StatelessWidget {
  const CustomUi({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomUiController());

    return Scaffold(
      /// -- header title
      appBar: TAppBar(
        title: Text(
          "Change your UI",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSettingMenuTile(
                    contentPadding: EdgeInsets.zero,
                    title: "Theme mode",
                    subTitle: "Change your favorite theme mode or default is systerm mode",
                    icon: Icons.change_circle_sharp,
                    trailing: SizedBox(
                      width: 70,
                      child: TToggleSwitch(
                          value: THelperFunctions.isDarkMode(context) == false,
                          inactiveText: "Dark",
                          activeText: "Light",
                          onToggle: (value) => controller.toggleThemeMode(context),
                        ),
                    )
                  ),

                  TSettingMenuTile(
                    contentPadding: EdgeInsets.zero,
                    title: "Language",
                    subTitle: "Change your locale language",
                    icon: Icons.change_circle_sharp,
                    trailing: SizedBox(
                      width: 70,
                      child: TToggleSwitch(
                          value: controller.valueOfLocaleToggle(),
                          inactiveText: "Vi",
                          activeText: "En",
                          onToggle: (value) => controller.toggleLocale(value),
                        ),
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

