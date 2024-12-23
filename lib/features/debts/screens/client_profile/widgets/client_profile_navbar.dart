import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class ClientProfileNavBar extends StatelessWidget {
  const ClientProfileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 55.h,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.addPayment);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: TColors.greenColor,
                  backgroundColor: TColors.greenColor,
                  side: const BorderSide(color: TColors.greenColor, width: 2),
                ),
                child: Text(TranslationKey.kPayment, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: Colors.white)),
              ),
            ),
          ),
          15.horizontalSpace,
          Expanded(
              child: SizedBox(
                  height: 55.h,
                  child: OutlinedButton(
                      onPressed: () => Get.toNamed(AppRoutes.addDebt),
                      child: Center(child: Text(TranslationKey.kBuying, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.redColor)))))),
        ],
      ),
    );
  }
}
