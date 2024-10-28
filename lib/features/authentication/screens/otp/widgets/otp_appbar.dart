import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class OtpAppbar extends StatelessWidget {
  const OtpAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(),
            icon: Container(
                width: 34, height: 34, decoration: const BoxDecoration(
                color: TColors.borderPrimary, borderRadius: BorderRadius.all(Radius.circular(14))),
                child: const Center(child: Icon(Icons.arrow_back_ios_new, color: Color(0xFF353535),)))),
        Text("تأكيد الحساب", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
        const SizedBox()
      ],
    );
  }
}
