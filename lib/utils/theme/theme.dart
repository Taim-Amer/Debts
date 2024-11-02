import 'package:flutter/material.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/theme/custom_themes/appbar_theme.dart';
import 'package:taha_debts/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:taha_debts/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:taha_debts/utils/theme/custom_themes/chip_theme.dart';
import 'package:taha_debts/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:taha_debts/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:taha_debts/utils/theme/custom_themes/radio_theme.dart';
import 'package:taha_debts/utils/theme/custom_themes/text_button_theme.dart';
import 'package:taha_debts/utils/theme/custom_themes/text_field_theme.dart';
import 'package:taha_debts/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    primaryColorLight: TColors.buttonPrimary,
    useMaterial3: true,
    fontFamily: 'Almarai',
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme(false),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutLinedButtonTheme.lightOutLinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
    radioTheme: TRadioTheme.lightRadioTheme,
    dividerColor: const Color(0xFFD5D5D5),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColorDark: TColors.buttonPrimary,
    useMaterial3: true,
    fontFamily: 'Almarai',
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme(false),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    textButtonTheme: TTextButtonTheme.darkTextButtonTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: TOutLinedButtonTheme.darkOutLinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
    radioTheme: TRadioTheme.darkRadioTheme,
    dividerColor: TColors.dark,
  );
}
