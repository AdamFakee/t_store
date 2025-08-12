import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/localization/localization.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/popups/confirm_popup.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class CustomUiController extends GetxController {
  static CustomUiController get instace => Get.find();

  // variables
  final _localization = Get.put(TLocalization());
  // late final Rx<Locale> _locale;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  void _init () {
    // _locale.value = _localization.locale.value;
  }

  void toggleLocale(bool value) {
    switch (value) {
      case true:
        _localization.changeLocale(LocaleType.en);
        break;
      case false:
        _localization.changeLocale(LocaleType.vi);
        break;
    }
  }

  bool valueOfLocaleToggle() {
    return _localization.locale.value == Locale(LocaleType.en.name);
  }

  void toggleThemeMode(BuildContext context) {
    bool isDarkMode = THelperFunctions.isDarkMode(context);
    Get.changeThemeMode( isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

}