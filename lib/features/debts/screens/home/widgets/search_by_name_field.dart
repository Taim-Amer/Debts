import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class SearchByNameTextField extends StatelessWidget {
  const SearchByNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.search),
        hintText: TArabicTexts.searchByName,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
        border: InputBorder.none,
      ),
      cursorColor: TColors.buttonPrimary,
      keyboardType: TextInputType.phone,
    );
  }
}
