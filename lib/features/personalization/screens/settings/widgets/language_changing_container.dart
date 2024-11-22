import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/personalization/controllers/settings/settings_controller.dart';
import 'package:taha_debts/features/personalization/screens/settings/widgets/language_radio_tile.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class LanguageChangingContainer extends StatelessWidget {
  const LanguageChangingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      backgroundColor: dark ? TColors.dark :TColors.lightGrey,
      width: 394.w,
      height: 150.h,
      radius: 12.r,
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w, vertical: 31.h),
      child: Column(
        children: [
          Obx(() => Expanded(
            child: LanguageRadioTile(
              title: TranslationKey.kArabic,
              value: 1,
              groupValue: SettingsController.instance.selectedLanguage.value ?? 2,
              onChanged: (value) => SettingsController.instance.setSelectedRadio(1),
            ),
          )),
          40.verticalSpace,
          Obx(() => Expanded(
            child: LanguageRadioTile(
              title: TranslationKey.kEnglish,
              value: 2,
              groupValue: SettingsController.instance.selectedLanguage.value ?? 2,
              onChanged: (value) => SettingsController.instance.setSelectedRadio(2),
            ),
          )),
        ],
      ),
    );
  }
}



