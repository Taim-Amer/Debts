import 'package:flutter/material.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class PayAdditionNavbar extends StatelessWidget {
  const PayAdditionNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.greenColor,
            foregroundColor: TColors.greenColor,
            side: const BorderSide(color: TColors.greenColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(TTexts.payment, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white, fontSize: 20),),
        ),
      ),
    );
  }
}
