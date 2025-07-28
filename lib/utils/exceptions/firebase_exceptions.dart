import 'package:t_store/utils/constants/text_strings.dart';

class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'permission-denied':
        return TTexts.permissionDeniedMessage;
      case 'unavailable':
        return TTexts.unavailableMessage;
      case 'weak-password':
        return TTexts.weakPasswordMessage;
      case 'email-already-in-use':
        return TTexts.emailAlreadyInUserMessage;
      case 'invalid-email':
        return TTexts.invalidEmailMessage;
      default:
        return TTexts.firebaseGeneralErrorMessage;
    }
  }
}