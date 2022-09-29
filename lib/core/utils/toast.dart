import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { info, error, success }

void toastMessage({
  required String mess,
  required ToastType toastType,
}) {
  Color? color;

  if (toastType == ToastType.info) {
    color = Colors.amberAccent.shade700;
  } else if (toastType == ToastType.error) {
    color = Colors.redAccent.shade700;
  } else if (toastType == ToastType.success) {
    color = Colors.greenAccent.shade700;
  }

  Fluttertoast.showToast(
      msg: mess,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}
