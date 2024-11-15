import 'package:flutter/material.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class AddAnotherPhoneNumberButton extends StatelessWidget {
  const AddAnotherPhoneNumberButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){}, child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(Icons.add, size: 20, color: TColors.buttonPrimary,),
        Text(TranslationKey.kAddAnotherPhone, style: const TextStyle(color: TColors.buttonPrimary),),
      ],
    ));
  }
}
