import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/controllers/signin/signin_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    String code = TCacheHelper.getData(key: "code");
    return Column(
      children: [
        SvgPicture.asset(TImages.lock),
        TSizes.spaceBtwSections.verticalSpace,
        Text(TranslationKey.kVerificationCode, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20),),
        8.verticalSpace,
        Text(
          "${TranslationKey.kOtpEnter}($code)",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
