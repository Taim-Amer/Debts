import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/features/settings/screens/widgets/language_changing_container.dart';
import 'package:taha_debts/features/settings/screens/widgets/setting_appbar.dart';
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
              const SettingAppbar(),
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
              const LanguageChangingContainer(),
              TSizes.spaceBtwSections.verticalSpace,
              const Divider(color: Color(0xFFD5D5D5)),
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
