import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class HomeFilterContainer extends StatelessWidget {
  const HomeFilterContainer({
    super.key,
    required this.title,
    this.icon,
    required this.function,
    this.showCounter = false,
    this.count,
  });

  final String title;
  final IconData? icon;
  final VoidCallback function;
  final bool? showCounter;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: showCounter == true ? Stack(
        children: [
          TRoundedContainer(
            height: 35.h,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: const Color(0xFFBFE3FF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: TColors.buttonPrimary, size: TSizes.iconSm),
                  const SizedBox(width: 4),
                ],
                Flexible(child: Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 10, color: TColors.buttonPrimary))),
              ],
            ),
          ),
          Positioned(
              left: 0,
              top: -1,
              child: count != null ? TRoundedContainer(
                backgroundColor: TColors.redColor,
                width: 18.w,
                height: 18.h,
                child: Center(child: Text(count.toString(), style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 8, fontWeight: FontWeight.w400, color: TColors.white),)),
              ) : const SizedBox(),
          ),
        ],
      ) : TRoundedContainer(
        height: 35.h,
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: const Color(0xFFBFE3FF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: TColors.buttonPrimary, size: TSizes.iconSm),
              const SizedBox(width: 4),
            ],
            Flexible(child: Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 10, color: TColors.buttonPrimary))),
          ],
        ),
      ),
    );
  }
}
