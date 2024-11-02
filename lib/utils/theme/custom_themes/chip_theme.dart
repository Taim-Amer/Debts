import 'package:flutter/material.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme(bool isSelected) {
    return ChipThemeData(
      disabledColor: Colors.white, // White background when disabled
      backgroundColor: isSelected ? TColors.buttonPrimary : Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : TColors.buttonPrimary, // White text when selected, primary color otherwise
      ),
      selectedColor: TColors.buttonPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      checkmarkColor: isSelected ? Colors.white : Colors.transparent, // Only show checkmark when selected
      shape: StadiumBorder(
        side: BorderSide(
          color: isSelected ? Colors.transparent : TColors.buttonPrimary, // Border only when not selected
          width: 1.5,
        ),
      ),
    );
  }

  static ChipThemeData darkChipTheme(bool isSelected) {
    return ChipThemeData(
      disabledColor: Colors.white,
      backgroundColor: isSelected ? TColors.buttonPrimary : Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : TColors.buttonPrimary,
      ),
      selectedColor: TColors.buttonPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      checkmarkColor: isSelected ? Colors.white : Colors.transparent,
      shape: StadiumBorder(
        side: BorderSide(
          color: isSelected ? Colors.transparent : TColors.buttonPrimary,
          width: 1.5,
        ),
      ),
    );
  }
}
