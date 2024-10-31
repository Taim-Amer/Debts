import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/features/notifications/screens/widgets/notification_item.dart';
import 'package:taha_debts/features/notifications/screens/widgets/notifications_appbar.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const NotificationsAppbar(),
              TSizes.spaceBtwSections.verticalSpace,
              const NotificationItem(),
              const NotificationItem(),
              const NotificationItem(),
              const NotificationItem(),
              const NotificationItem(),
              const NotificationItem(),
              const NotificationItem(),
              const NotificationItem(),
            ],
          ),
        ),
      ),
    );
  }
}
