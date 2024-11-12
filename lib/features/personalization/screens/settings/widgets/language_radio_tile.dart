import 'package:flutter/material.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class LanguageRadioTile extends StatelessWidget {
  const LanguageRadioTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20)),
        const Spacer(),
        Transform.scale(
          scale: 40 / 35,
          child: Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: TColors.buttonPrimary,
          ),
        ),

      ],
    );
  }
}
