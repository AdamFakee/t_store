import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();

  /// Contain all about checking nettwok
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  /// Current connectivity network status
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Init the network manager and set up a stream to continually check the connection status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// Close the active connectivity stream
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if(result.contains(ConnectivityResult.none)) {
      _connectionStatus.value = ConnectivityResult.none;

      /// Show alter 
      TSnackBar.warningSnackBar(title: TTexts.noInternetTitle, message: TTexts.noInternetMessage);
    } else {
      _connectionStatus.value = result.first;
    }
  }

  /// Check the internet connection status
  /// 
  /// Return "true" if connected, "false" otherwise
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return !result.contains(ConnectivityResult.none);
    } on PlatformException catch (_) {
      return false;
    }
  }
}