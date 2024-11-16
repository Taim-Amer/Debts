import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';

class AnotherNumberAnimatedTextfield extends StatelessWidget {
  const AnotherNumberAnimatedTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
      height: DebtScheduleController.instance.anotherNumber.value ? 60.h : 0,
      duration: const Duration(milliseconds: 300),
      child: TextFieldWidget(
        controller: DebtScheduleController.instance.anotherNumberController,
        hint: "000-000-000",
      ),
    ));
  }
}