import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      title: TranslationKey.kAmount,
      hint: '1000.000 IQD',
      controller: DebtScheduleController.instance.amountController,
      keyboardType: TextInputType.number,
      validator: (value) => TValidator.validateEmptyText(" ${TranslationKey.kAmount}", value),
    );
  }
}