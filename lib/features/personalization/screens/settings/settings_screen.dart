import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/features/personalization/screens/settings/widgets/language_changing_container.dart';
import 'package:taha_debts/features/personalization/screens/settings/widgets/logout_dialog.dart';
import 'package:taha_debts/features/personalization/screens/settings/widgets/setting_appbar.dart';
import 'package:taha_debts/features/personalization/screens/settings/widgets/settings_tile.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: SettingAppbar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(TImages.translate),
                  8.horizontalSpace,
                  Text(TranslationKey.kLanguageChange, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: TColors.grey)),
                ],
              ),
              TSizes.spaceBtwSections.verticalSpace,
              const LanguageChangingContainer(),
              TSizes.spaceBtwSections.verticalSpace,
              const Divider(),
              SettingsTile(title: TranslationKey.kNotifications, icon: TImages.notifications, showSwitch: true,),
              SettingsTile(title: TranslationKey.kPrivacyPolicy, icon: TImages.information,),
              SettingsTile(title: TranslationKey.kAbout, icon: TImages.about,),
              SettingsTile(title: TranslationKey.kOut, icon: TImages.logout2, function: () => showLogoutDialog(context)),
            ],
          ),
        ),
      ),
    );
  }
}


