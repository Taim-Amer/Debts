import 'package:flutter/material.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class TRadioTheme{
  TRadioTheme._();

  static final lightRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.all(TColors.buttonPrimary),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  );

  static final darkRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.all(TColors.buttonPrimary),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  );
}