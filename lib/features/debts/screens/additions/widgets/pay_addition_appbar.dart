import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class PayAdditionAppbar extends StatelessWidget {
  const PayAdditionAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(TranslationKey.kAddNewCollection, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),),
        const BackIcon(),
      ],
    );
  }
}
