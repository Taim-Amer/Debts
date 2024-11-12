import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/additions_controller/additions_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class DebtAdditionRow extends StatelessWidget {
  const DebtAdditionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      Expanded(
          flex: 2,
          child: TextFieldWidget(
            controller: AdditionsController.instance.debtAmountController,
            title: "المبلغ",
            hint: "0.00 IQD",
            titleColor: TColors.grey,
            hintColor: TColors.redColor,
            hintSize: 14,
            radius: 6,
            validator: (value) => TValidator.validateEmptyText("المبلغ", value),
          )),
      8.horizontalSpace,
      Expanded(
          flex: 3,
          child: TextFieldWidget(
            controller: AdditionsController.instance.debtGoodsDescriptionController,
            title: TArabicTexts.productsDescription,
            hint: "وصف تفصيلي عن البضاعة",
            titleColor: TColors.grey,
            hintSize: 14,
            radius: 6,
            validator: (value) => TValidator.validateEmptyText("وصف البضاعة", value),
          )),
      ],
    );
  }
}
