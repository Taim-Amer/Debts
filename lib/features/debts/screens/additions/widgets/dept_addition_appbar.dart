import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/localization/keys.dart';

class DeptAdditionAppbar extends StatelessWidget {
  const DeptAdditionAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackIcon(),
        Text(TranslationKey.kAddDebts, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),),
        const SizedBox()
      ],
    );
  }
}
