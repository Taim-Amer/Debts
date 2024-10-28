import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class SigninHeader extends StatelessWidget {
  const SigninHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        80.verticalSpace,
        SvgPicture.asset(TImages.login),
        TSizes.spaceBtwItems.verticalSpace,
        Text(TTexts.welcome, style: Theme.of(context).textTheme.headlineMedium),
        TSizes.spaceBtwItems.verticalSpace,
        Text(TTexts.phoneInput, style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
