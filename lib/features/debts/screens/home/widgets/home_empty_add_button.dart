import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class HomeAddDebtsButton extends StatelessWidget {
  const HomeAddDebtsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 315.w, height: 50.h, child: ElevatedButton(onPressed: (){
      Get.toNamed(AppRoutes.debtSchedule);
    }, child: Text(TranslationKey.kAddDebts)));
  }
}
