import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/common/widgets/icons/circular_icon.dart';
import 'package:taha_debts/features/personalization/controllers/settings/settings_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class SettingAppbar extends StatelessWidget {
  const SettingAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TCircularIcon(
          icon: dark ? Icons.sunny : Icons.nightlight_outlined,
          size: TSizes.iconMd,
          color: dark ? TColors.lightGrey : const Color(0xFF353535),
          backgroundColor: Colors.transparent,
          // width: 34.w,
          // height: 34.h,
          // radius: 14.r,
          onPressed: () => SettingsController.instance.updateThemeMode(dark ? ThemeMode.light : ThemeMode.dark),
        ),
        Text(TranslationKey.kSettings, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, color: TColors.grey)),
        const BackIcon(),
      ],
    );
  }
}
