import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/settings/screens/widgets/language_radio_tile.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class LanguageChangingContainer extends StatelessWidget {
  const LanguageChangingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      backgroundColor: TColors.lightGrey,
      width: 394.w,
      height: 150.h,
      radius: 12.r,
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w, vertical: 31.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(child: LanguageRadioTile(title: TTexts.arabic)),
          30.verticalSpace,
          const Expanded(child: LanguageRadioTile(title: TTexts.english))
        ],
      ),
    );
  }
}
