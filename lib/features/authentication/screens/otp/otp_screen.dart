import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/authentication/controllers/otp/otp_controller.dart';
import 'package:taha_debts/features/authentication/controllers/signin/signin_controller.dart';
import 'package:taha_debts/features/authentication/screens/otp/widgets/otp_appbar.dart';
import 'package:taha_debts/features/authentication/screens/otp/widgets/otp_header.dart';
import 'package:taha_debts/features/authentication/screens/otp/widgets/otp_next_button.dart';
import 'package:taha_debts/features/authentication/screens/otp/widgets/otp_resend_code_row.dart';
import 'package:taha_debts/features/authentication/screens/otp/widgets/otp_textfield_widget.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController = Get.find<OtpController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const OtpAppbar(),
              37.verticalSpace,
              const OtpHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              SizedBox(width : THelperFunctions.screenWidth(context), child: OtpTextFieldWidget(controller: otpController.codeController)),
              TSizes.spaceBtwSections.verticalSpace,
              Obx(() {
                Widget current = otpController.otpApiStatus.value == RequestState.loading ? const LoadingWidget() : const OtpNextButton();
                return current;
              }),
              TSizes.spaceBtwSections.verticalSpace,
              const OtpResendCodeRow()
            ],
          ),
        ),
      ),
    );
  }
}





