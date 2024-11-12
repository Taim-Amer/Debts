import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class AddNewDebtButton extends StatelessWidget {
  const AddNewDebtButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Widget current = DebtScheduleController.instance.createDebtApiStatus.value == RequestState.loading
              ? const Center(child: LoadingWidget())
              : SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        DebtScheduleController.instance.createDebt();
                      },
                      child: Text(TArabicTexts.add),
                  ),
      );
      return current;
    });
  }
}
