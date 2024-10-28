import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/features/authentication/controllers/signin/signin_controller.dart';
import 'package:taha_debts/features/authentication/screens/signin/widgets/signin_form.dart';
import 'package:taha_debts/features/authentication/screens/signin/widgets/signin_header.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signInController = Get.put(SignInController());
    return Scaffold(
      appBar: const TAppBar(),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: SvgPicture.asset(
          TImages.loginShape,
          fit: BoxFit.cover,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SigninHeader(),
            TSizes.spaceBtwSections.verticalSpace,
            const SigninForm(),
            TSizes.spaceBtwSections.verticalSpace,
            SizedBox(height: 20.h),
            SvgPicture.asset(
              TImages.loginShape,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
