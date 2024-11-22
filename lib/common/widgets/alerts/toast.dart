import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';

void showToast(String txt, ToastState toastState) => Fluttertoast.showToast(
    msg: txt,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 80,
    backgroundColor: chooseToastColor(toastState),
    textColor: Colors.white,
    fontSize: 16.0,
);

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = TColors.greenColor;
      break;
    case ToastState.error:
      color = TColors.redColor;
      break;
    case ToastState.warning:
      color = TColors.yellowColor;
      break;
  }
  return color;
}
