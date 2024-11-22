import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class SearchByNameTextField extends StatelessWidget {
  const SearchByNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: HomeController.instance.nameController,
      onFieldSubmitted: (value) => HomeController.instance.nameSearch(HomeController.instance.region?.value),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: TranslationKey.kSearchByName,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
        border: InputBorder.none,
      ),
      cursorColor: TColors.buttonPrimary,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.text,
    );
  }
}
