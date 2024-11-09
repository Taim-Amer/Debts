import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class ClientNameTextField extends StatelessWidget {
  const ClientNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      title: TTexts.clientName,
      hint: "تيم عامر",
      icon: Icons.person,
      controller: DebtScheduleController.instance.clientNameController,
      validator: (value) => TValidator.validateEmptyText("اسم العميل", value),
      keyboardType: TextInputType.name,
    );
  }
}