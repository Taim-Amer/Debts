import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/icons/circular_icon.dart';
import 'package:taha_debts/features/notifications/screens/notifications_screen.dart';
import 'package:taha_debts/features/personalization/screens/settings/settings_screen.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class HomeEmptyAppbar extends StatelessWidget {
  const HomeEmptyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: (){
              Get.to(const NotificationsScreen(), transition: Transition.rightToLeft);
            },
            icon: const Icon(Icons.notifications, size: TSizes.iconMd, color: TColors.buttonPrimary,)),
        18.horizontalSpace,
        IconButton(
            onPressed: (){
              Get.to(const SettingsScreen(), transition: Transition.rightToLeft);
            }, 
            icon: const Icon(Icons.settings, size: TSizes.iconMd, color: TColors.buttonPrimary,)),
        const Spacer(),
        Text("اسم المستخدم", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: const Color(0xFF6D6E72)),),
        8.horizontalSpace,
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
        )
      ],
    );
  }
}
