import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/personalization/screens/settings/widgets/language_radio_tile.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class LanguageChangingContainer extends StatefulWidget {
  const LanguageChangingContainer({super.key});

  @override
  State<LanguageChangingContainer> createState() => LanguageChangingContainerState();
}

class LanguageChangingContainerState extends State<LanguageChangingContainer> {
  int selectedLanguage = 1;

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
          Expanded(
            child: LanguageRadioTile(
              title: TTexts.arabic,
              value: 1,
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
          ),
          40.verticalSpace,
          Expanded(
            child: LanguageRadioTile(
              title: TTexts.english,
              value: 2,
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}


