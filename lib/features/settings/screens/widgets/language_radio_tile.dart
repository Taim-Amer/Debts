import 'package:flutter/material.dart';

class LanguageRadioTile extends StatelessWidget {
  const LanguageRadioTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(value: (){}, groupValue: (){}, onChanged: (value){}),
        const Spacer(),
        Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20),),
      ],
    );
  }
}
