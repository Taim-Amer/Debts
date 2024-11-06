import 'package:flutter/material.dart';
import 'package:taha_debts/features/authentication/controllers/otp/otp_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class OtpResendCodeRow extends StatelessWidget {
  const OtpResendCodeRow({super.key, required this.otpController});

  final OtpController otpController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            otpController.resendOtp();
          },
          child: Text(
            TTexts.resendCode,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 16,
              color: TColors.buttonSecondary,
              decoration: TextDecoration.underline,
              decorationColor: TColors.buttonSecondary,
              decorationThickness: 2,
              height: 2,
            ),
          ),
        ),
        Text(TTexts.resendCodeQuastion, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16),),
      ],
    );
  }
}