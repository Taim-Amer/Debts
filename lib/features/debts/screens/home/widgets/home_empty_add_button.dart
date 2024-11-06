import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/debts/screens/home/home_screen.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class HomeAddDebtsButton extends StatelessWidget {
  const HomeAddDebtsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 315.w, height: 50.h, child: ElevatedButton(onPressed: (){
      // Get.to(HomeScreen(), transition: Transition.rightToLeft);
      Get.toNamed(AppRoutes.debtSchedule);
    }, child: const Text(TTexts.addDebts)));
  }
}
