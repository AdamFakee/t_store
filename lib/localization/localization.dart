import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/get_storage_key.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

/// this class is used for localization 
/// 
/// support 2 locale: vi - en ( vietnam - england )
class TLocalization extends GetxController {
  static TLocalization get instance => Get.find();

  
  final _storageKey = TGetStorageKey.locale;

  // variables
  final Rx<Locale> _locale = Locale(LocaleType.en.name).obs; // your local language
  final TLocalStorage _storage = TLocalStorage();

  final _auth = FirebaseAuth.instance;

  Rx<Locale> get locale => _locale;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  void _init() {
    if(_auth.currentUser == null) {
      _locale.value = Locale(LocaleType.en.name);
      return;
    }
    final String locale = _storage.readData(_storageKey) ?? "";

    // default: english
    _locale.value = locale.isEmpty ? Locale(LocaleType.en.name) : Locale(locale);
  }

  /// this func used for changing locale 
  /// 
  /// support 2 locale: vi - en
  Future<void> changeLocale (LocaleType locale) async {
    // change value
    _locale.value = Locale(locale.name);

    Get.updateLocale(_locale.value);
    // save storage
    await _storage.saveData(_storageKey, locale.name);
  }
}