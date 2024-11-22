import 'package:flutter/material.dart';
import 'package:taha_debts/features/debts/controllers/additions_controller/additions_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class DebtAdditionNavbar extends StatelessWidget {
  const DebtAdditionNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          onPressed: (){
            AdditionsController.instance.addDebt();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.redColor,
            foregroundColor: TColors.redColor,
            side: const BorderSide(color: TColors.redColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(TranslationKey.kBuying, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white, fontSize: 20),),
        ),
      ),
    );
  }
}
