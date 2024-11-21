import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/icons/circular_icon.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key, this.function});

  final Function()? function;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCircularIcon(
      icon: Icons.arrow_forward_ios_rounded,
      size: TSizes.iconMd,
      color: dark ? TColors.lightGrey : const Color(0xFF353535),
      backgroundColor: dark ? TColors.darkGrey : TColors.borderPrimary,
      width: 34.w,
      height: 34.h,
      radius: 14.r,
      onPressed: function ?? () => Get.back(),
    );
  }
}
