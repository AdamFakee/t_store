import 'package:t_store/utils/constants/text_strings.dart';

class TFirebaseAuthExceptions {
  TFirebaseAuthExceptions(this.code);

  final String code;

  String get message {
    switch (code) {
      case "weak-password":
        return TTexts.weakPasswordMessage;
      case "email-already-in-use":
        return TTexts.emailAlreadyInUserMessage;
      default: 
        return TTexts.signupFailsMessage;
    }
  }
}