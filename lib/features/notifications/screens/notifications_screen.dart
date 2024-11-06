import 'package:flutter/material.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/features/notifications/screens/widgets/notification_item.dart';
import 'package:taha_debts/features/notifications/screens/widgets/notifications_appbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: NotificationsAppbar(),),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotificationItem(),
              NotificationItem(),
              NotificationItem(),
              NotificationItem(),
              NotificationItem(),
              NotificationItem(),
              NotificationItem(),
              NotificationItem(),
            ],
          ),
        ),
      ),
    );
  }
}
