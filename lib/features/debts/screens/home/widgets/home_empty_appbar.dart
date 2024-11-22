import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/icons/circular_icon.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/notification_icon.dart';
import 'package:taha_debts/features/personalization/controllers/profile/profile_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCircularIcon(
          icon: Icons.person,
          size: TSizes.iconMd,
          color: Colors.black,
          backgroundColor: TColors.borderPrimary,
          width: 36,
          height: 36,
          onPressed: (){
            Get.toNamed(AppRoutes.profile);
          },
        ),
        8.horizontalSpace,
        Obx(() => Text(ProfileController.instance.userProfileModel.value.data?.name ?? "", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: const Color(0xFF6D6E72)))),
        const Spacer(),
        IconButton(
            onPressed: () => Get.toNamed(AppRoutes.settings),
            icon: const Icon(Icons.settings, size: TSizes.iconMd, color: TColors.buttonPrimary,)),
        const NotificationIcon()
      ],
    );
  }
}

