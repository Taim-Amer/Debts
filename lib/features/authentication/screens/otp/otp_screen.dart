import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/features/authentication/screens/otp/widgets/otp_appbar.dart';
import 'package:taha_debts/features/authentication/screens/otp/widgets/otp_header.dart';
import 'package:taha_debts/features/authentication/screens/otp/widgets/otp_next_button.dart';
import 'package:taha_debts/features/authentication/screens/otp/widgets/otp_resend_code_row.dart';
import 'package:taha_debts/features/authentication/screens/otp/widgets/otp_textfield_widget.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
            child: Column(
              children: [
                const OtpAppbar(),
                37.verticalSpace,
                const OtpHeader(),
                TSizes.spaceBtwSections.verticalSpace,
                const OtpTextFieldWidget(),
                TSizes.spaceBtwSections.verticalSpace,
                const OtpNextButton(),
                TSizes.spaceBtwSections.verticalSpace,
                const OtpResendCodeRow()
              ],
            ),
          ),
        ),
      ),
    );
  }
}






