import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class PageNumberTextField extends StatelessWidget {
  const PageNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      title: TranslationKey.kPageNumber,
      hint: "صفحة رقم : 450",
      icon: Icons.book,
      controller: DebtScheduleController.instance.pageNumberController,
      validator: (value) => TValidator.validateEmptyText(" ${TranslationKey.kPageNumber}", value),
      keyboardType: TextInputType.number,
    );
  }
}