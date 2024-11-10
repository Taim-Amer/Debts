import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/icons/circular_icon.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:get/get.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return HomeController.instance.getDebtsApiStatus.value == RequestState.success ? TCircularIcon(
        icon: Icons.add,
        backgroundColor: TColors.buttonPrimary,
        width: 64.w,
        height: 64.h,
        size: 34,
        color: Colors.white,
        onPressed: () {
          // Navigate to DebtScheduleScreen
          // Get.to(const DebtScheduleScreen(), transition: Transition.rightToLeft);
        },
      ) : const SizedBox();
    });
  }
}
