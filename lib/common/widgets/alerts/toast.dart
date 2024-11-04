import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';

void showToast(String txt, ToastState toastState) => Fluttertoast.showToast(
    msg: txt,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 100,
    backgroundColor: chooseToastColor(toastState),
    textColor: Colors.white,
    fontSize: 16.0);


Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = TColors.success;
      break;
    case ToastState.error:
      color = TColors.error;
      break;
    case ToastState.warning:
      color = TColors.warning;
      break;
  }
  return color;
}
