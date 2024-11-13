import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class HomeFilterContinueButton extends StatelessWidget {
  const HomeFilterContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 260.w, height: 50.h, child: ElevatedButton(onPressed: () => Get.back(), child: Text(TArabicTexts.tcontinue)));
  }
}
