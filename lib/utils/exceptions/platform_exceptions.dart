import 'package:t_store/utils/constants/text_strings.dart';

class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'network_error':
        return TTexts.networkErrorMessage;
      case 'device_not_supported':
        return TTexts.deviceNotSupportMessage;
      default:
        return TTexts.platformGeneralErrorMessage;
    }
  }
}