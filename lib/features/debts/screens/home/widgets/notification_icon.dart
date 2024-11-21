import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/notifications/controllers/notification_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.toNamed(AppRoutes.notification),
            icon: const Icon(Icons.notifications, size: TSizes.iconMd, color: TColors.buttonPrimary,)),
        NotificationController.instance.notificationsModel.value.data?.length != null ? Positioned(
          left: 0,
          top: 0,
          child: TRoundedContainer(
            backgroundColor: TColors.redColor,
            width: 18.w,
            height: 18.h,
            child: Center(child: Text(NotificationController.instance.notificationsModel.value.data?.length.toString() ?? "", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 8, fontWeight: FontWeight.w400, color: TColors.white),)),
          ),
        ) : const SizedBox()
      ],
    );
  }
}
