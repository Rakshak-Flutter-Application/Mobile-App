import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static focusChange(BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, fontSize: 20);
  }

  static void flushbarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          positionOffset: 30,
          flushbarPosition: FlushbarPosition.TOP,
          forwardAnimationCurve: Curves.bounceIn,
          icon: const Icon(
            Icons.check_box,
            color: Colors.white,
            size: 25,
          ),
          backgroundColor: Colors.lightGreen,
          message: message,
          messageSize: 20,
          borderRadius: BorderRadius.circular(10),
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static snackbar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
