import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        103.verticalSpace,
        Text(TAppTranslations.kRegisterTitle, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: TColors.buttonPrimary)),
        TSizes.spaceBtwItems.verticalSpace,
        Text(TAppTranslations.kRegisterSubTitle, style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
