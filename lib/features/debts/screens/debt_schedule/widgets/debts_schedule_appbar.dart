import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class DebtsScheduleAppbar extends StatelessWidget {
  const DebtsScheduleAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(TArabicTexts.addDebts, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
        const BackIcon(),
      ],
    );
  }
}
