import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class MonthlyPaymentTextField extends StatelessWidget {
  const MonthlyPaymentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      title: TTexts.monthlyPayment,
      hint: '100.000 IQD',
      controller: DebtScheduleController.instance.monthlyPaymentController,
      keyboardType: TextInputType.number,
    );
  }
}