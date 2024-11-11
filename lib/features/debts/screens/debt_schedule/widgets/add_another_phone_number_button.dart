import 'package:flutter/material.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class AddAnotherPhoneNumberButton extends StatelessWidget {
  const AddAnotherPhoneNumberButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){}, child: Row(
      children: [
        Text(TArabicTexts.addAnotherPhone, style: const TextStyle(color: TColors.buttonPrimary),),
        const Icon(Icons.add, size: 20, color: TColors.buttonPrimary,),
      ],
    ));
  }
}
