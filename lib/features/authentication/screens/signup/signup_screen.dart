import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/authentication/controllers/signup/signup_controller.dart';
import 'package:taha_debts/features/authentication/screens/signup/widgets/email_textfield.dart';
import 'package:taha_debts/features/authentication/screens/signup/widgets/signup_header.dart';
import 'package:taha_debts/features/authentication/screens/signup/widgets/username_textfield.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final signupController = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      bottomNavigationBar: SizedBox(width: double.infinity, child: SvgPicture.asset(TImages.loginShape, fit: BoxFit.cover)),
      body: Form(
        key: signupController.signupFormKey,
        child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SignupHeader(),
                  TSizes.spaceBtwInputField.verticalSpace,
                  UsernameTextField(),
                  TSizes.spaceBtwInputField.verticalSpace,
                  EmailTextField(),
                  TSizes.spaceBtwSections.verticalSpace,
                  Obx(() {
                    Widget current = signupController.signupApiStatus.value == RequestState.loading ? const LoadingWidget() : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          signupController.signup();
                        },
                        child: const Text(TTexts.next),
                      ),
                    );
                    return current;
                  })
                ],
              ),
            ),
          ),
      ),
    );
  }
}



