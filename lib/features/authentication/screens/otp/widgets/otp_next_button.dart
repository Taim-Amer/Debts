import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/controllers/otp/otp_controller.dart';
import 'package:taha_debts/localization/keys.dart';

class OtpNextButton extends StatelessWidget {
  const OtpNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController = Get.find<OtpController>();
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: (){
        otpController.verify();
      }, child: Text(TranslationKey.kNext)),
    );
  }
}
