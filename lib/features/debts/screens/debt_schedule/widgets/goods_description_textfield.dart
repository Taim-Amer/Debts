import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/localization/keys.dart';

class GoodsDescriptionTextField extends StatelessWidget {
  const GoodsDescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      title: TranslationKey.kProductDescription,
      hint: TranslationKey.kHouseFurniture,
      controller: DebtScheduleController.instance.goodsDescriptionController,
      keyboardType: TextInputType.text,
    );
  }
}