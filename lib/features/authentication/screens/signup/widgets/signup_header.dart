import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        103.verticalSpace,
        Text(TranslationKey.kRegisterTitle, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: TColors.buttonPrimary)),
        TSizes.spaceBtwItems.verticalSpace,
        Text(TranslationKey.kRegisterSubTitle, style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
