import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/icons/circular_icon.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return TCircularIcon(icon: Icons.arrow_back_ios_new, size: TSizes.iconMd, color: Colors.black, backgroundColor: TColors.borderPrimary, width: 36, height: 36, radius: 14, onPressed: () => Get.back(),);
  }
}