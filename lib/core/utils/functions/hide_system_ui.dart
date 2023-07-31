import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {


  static void dismissKeyboard(BuildContext context) {
    // Dismiss keyboard
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }
}

void hideSystemUI() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}
