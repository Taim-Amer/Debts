import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class DebtAdditionRow extends StatelessWidget {
  const DebtAdditionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 3,child: TextFieldWidget(title: TTexts.productsDescription, hint: "وصف تفصيلي عن البضاعة", titleColor: TColors.grey, hintSize: 14, radius: 6,)),
        8.horizontalSpace,
        const Expanded(flex: 2,child: TextFieldWidget(title: "المبلغ", hint: "0.00 IQD", titleColor: TColors.grey, hintColor: TColors.redColor, hintSize: 14, radius: 6,)),
      ],
    );
  }
}
