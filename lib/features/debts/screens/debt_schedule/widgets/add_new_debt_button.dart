import 'package:flutter/material.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class AddNewDebtButton extends StatelessWidget {
  const AddNewDebtButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              DebtScheduleController.instance.createDebt();
            },
            child: const Text(TTexts.add)));
  }
}
