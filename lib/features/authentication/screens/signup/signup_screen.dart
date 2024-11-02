import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/features/authentication/screens/signup/widgets/email_textfield.dart';
import 'package:taha_debts/features/authentication/screens/signup/widgets/signup_header.dart';
import 'package:taha_debts/features/authentication/screens/signup/widgets/username_textfield.dart';
import 'package:taha_debts/features/debts/screens/home/home_empty_screen.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      bottomNavigationBar: SizedBox(width: double.infinity, child: SvgPicture.asset(TImages.loginShape, fit: BoxFit.cover)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SignupHeader(),
            TSizes.spaceBtwInputField.verticalSpace,
            const UsernameTextField(),
            TSizes.spaceBtwInputField.verticalSpace,
            const EmailTextField(),
            TSizes.spaceBtwSections.verticalSpace,
            SizedBox(width: double.infinity, height: 50, child: ElevatedButton(onPressed: (){
              Get.to(HomeEmptyScreen(), transition: Transition.rightToLeft);
            }, child: const Text(TTexts.next))),
          ],
        ),
      ),
    );
  }
}



