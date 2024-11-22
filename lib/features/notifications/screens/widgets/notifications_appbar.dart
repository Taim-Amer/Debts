import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/localization/keys.dart';

class NotificationsAppbar extends StatelessWidget {
  const NotificationsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(TranslationKey.kNotifications, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
        const BackIcon(),
      ],
    );
  }
}
