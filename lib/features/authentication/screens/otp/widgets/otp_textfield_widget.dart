import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class OtpTextFieldWidget extends StatelessWidget {
  const OtpTextFieldWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OtpTextField(
        mainAxisAlignment: MainAxisAlignment.center,
        fieldWidth: 50,
        fieldHeight: 60,
        showCursor: false,
        alignment: Alignment.center,
        numberOfFields: 5,
        borderRadius: BorderRadius.circular(12),
        focusedBorderColor: TColors.buttonPrimary,
        showFieldAsBox: true,
        borderColor: TColors.buttonPrimary,
        onCodeChanged: (String code) {
        },
        onSubmit: (String code) {
          controller.text = code;
        },
      ),
    );
  }
}
