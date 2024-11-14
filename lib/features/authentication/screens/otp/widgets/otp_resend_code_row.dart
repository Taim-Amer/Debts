import 'package:flutter/material.dart';
import 'package:taha_debts/features/authentication/controllers/otp/otp_controller.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class OtpResendCodeRow extends StatelessWidget {
  const OtpResendCodeRow({super.key});

  // final OtpController otpController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(TAppTranslations.kResendCodeQuestion, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16),),
        TextButton(
          onPressed: () {
            OtpController.instance.resendOtp();
          },
          child: Text(
            TAppTranslations.kResendCode,
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
      ],
    );
  }
}