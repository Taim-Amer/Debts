import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class ClientPhoneTextField extends StatelessWidget {
  const ClientPhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      title: TranslationKey.kClientPhone,
      hint: "000-000-000",
      icon: Icons.phone_android,
      controller: DebtScheduleController.instance.clientNumberController,
      validator: (value) => TValidator.validatePhoneNumber(value),
    );
  }
}