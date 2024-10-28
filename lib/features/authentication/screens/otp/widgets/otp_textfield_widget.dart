import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class OtpTextFieldWidget extends StatelessWidget {
  const OtpTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      fieldWidth: 60,
      fieldHeight: 60,
      showCursor: false,
      alignment: Alignment.center,
      numberOfFields: 5,
      borderRadius: BorderRadius.circular(12),
      focusedBorderColor: TColors.buttonPrimary,
      showFieldAsBox: true,
      onCodeChanged: (String code) {},
      borderColor: TColors.buttonPrimary,
      onSubmit: (String code) {},
    );
  }
}
