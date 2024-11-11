import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class NotationAppbar extends StatelessWidget {
  const NotationAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackIcon(),
        Text(TArabicTexts.notations, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
        const SizedBox()
      ],
    );
  }
}
