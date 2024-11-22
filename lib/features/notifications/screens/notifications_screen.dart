import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/features/notifications/controllers/notification_controller.dart';
import 'package:taha_debts/features/notifications/screens/widgets/notification_item.dart';
import 'package:taha_debts/features/notifications/screens/widgets/notifications_appbar.dart';
import 'package:taha_debts/features/notifications/screens/widgets/notifications_shimmer.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/device/device_utility.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const TAppBar(title: NotificationsAppbar()),
      body:  Obx(() => NotificationController.instance.getNotificationStatus.value == RequestState.loading  ? const NotificationsShimmer() : SingleChildScrollView(
        child: RefreshIndicator(
          backgroundColor: dark ? TColors.dark : TColors.light,
          color: TColors.primary,
          onRefresh: () => NotificationController.instance.getNotifications(),
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace.h),
            child: SizedBox(
              height: TDeviceUtils.getScreenHeight() - (TDeviceUtils.getAppBarHeight() + 50),
              child: ListView.separated(
                itemCount: NotificationController.instance.notificationsModel.value.data?.length ?? 0,
                itemBuilder: (context, index) => NotificationItem(
                  title: NotificationController.instance.notificationsModel.value.data?[index].title ?? "",
                  body: NotificationController.instance.notificationsModel.value.data?[index].body ?? "",
                  time: NotificationController.instance.notificationsModel.value.data?[index].time ?? "",
                ),
                separatorBuilder: (context, _) => const Divider(color: Color(0xFFE3E3E3)),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
