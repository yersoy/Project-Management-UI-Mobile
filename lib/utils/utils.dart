import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showDefaultSnackbar(BuildContext context, String message, Widget? icon) => Flushbar(
        message: message,
        icon: icon,
        duration: const Duration(seconds: 3),
      )..show(context);
}
