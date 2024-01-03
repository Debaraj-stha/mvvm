import 'package:flutter/material.dart';

class Utils {
  // static void showFlushbarMessage(BuildContext context, String message,
  //     {Color color = Colors.red}) {
  //   Flushbar(
  //     margin: const EdgeInsets.all(8),
  //     flushbarPosition: FlushbarPosition.BOTTOM,
  //     forwardAnimationCurve: Curves.easeInOut,
  //     reverseAnimationCurve: Curves.easeOut,
  //     message: message,
  //     backgroundColor: color,
  //     messageColor: Colors.white,
  //     animationDuration: const Duration(seconds: 1),
  //   ).show(context);
  // }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static void showSnackBar(BuildContext context, String message,
      {Color bgColor = Colors.red, Color textColor = Colors.white}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: bgColor,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      closeIconColor: Colors.red,
      showCloseIcon: true,
      duration: const Duration(seconds: 1),
      shape: const LinearBorder(),
    ));
  }
}
