import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class OtpAppbar extends StatelessWidget {
  const OtpAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(TAppTranslations.kOtpTitle, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
        const BackIcon(),
      ],
    );
  }
}

