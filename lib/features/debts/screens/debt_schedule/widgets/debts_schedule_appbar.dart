import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/localization/keys.dart';

class DebtsScheduleAppbar extends StatelessWidget {
  const DebtsScheduleAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(TranslationKey.kAddDebts, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
        const BackIcon(),
      ],
    );
  }
}
