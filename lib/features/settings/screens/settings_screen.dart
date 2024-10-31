import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/notations/screens/widgets/notation_appbar.dart';
import 'package:taha_debts/features/settings/screens/widgets/language_radio_tile.dart';
import 'package:taha_debts/features/settings/screens/widgets/settings_tile.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackIcon(),
                  Text(TTexts.settings, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, color: TColors.grey)),
                  const SizedBox()
                ],
              ),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(TTexts.languageChange, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: TColors.grey)),
                  8.horizontalSpace,
                  SvgPicture.asset(TImages.translate),
                ],
              ),
              TSizes.spaceBtwSections.verticalSpace,
              TRoundedContainer(
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
              ),
              TSizes.spaceBtwSections.verticalSpace,
              const Divider(color: Color(0xFFD5D5D5),),

              const SettingsTile(title: TTexts.notifications, icon: TImages.notifications,),
              const SettingsTile(title: TTexts.privacyPolicy, icon: TImages.information,),
              const SettingsTile(title: TTexts.about, icon: TImages.about,),
              const SettingsTile(title: TTexts.out, icon: TImages.logout,),
            ],
          ),
        ),
      ),
    );
  }
}
