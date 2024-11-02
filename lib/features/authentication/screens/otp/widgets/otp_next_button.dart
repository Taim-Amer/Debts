import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:taha_debts/features/authentication/screens/signup/signup_screen.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class OtpNextButton extends StatelessWidget {
  const OtpNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: (){
        Get.to(const SignupScreen(), transition: Transition.rightToLeft);
      }, child: const Text(TTexts.next)),
    );
  }
}
