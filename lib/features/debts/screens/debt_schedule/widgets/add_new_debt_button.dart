import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/debts/screens/client_profile/client_profile_screen.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class AddNewDebtButton extends StatelessWidget {
  const AddNewDebtButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, height: 50, child: ElevatedButton(onPressed: (){
      Get.to(ClientProfileScreen(), transition: Transition.rightToLeft);
    }, child: const Text(TTexts.add)));
  }
}
