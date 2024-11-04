import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class HomeFilterContainer extends StatelessWidget {
  const HomeFilterContainer({
    super.key,
    required this.title,
    this.icon,
    required this.function,
  });

  final String title;
  final IconData? icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: TRoundedContainer(
        height: 35.h,
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: const Color(0xFFBFE3FF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 10, color: TColors.buttonPrimary))),
            if (icon != null) ...[
              const SizedBox(width: 4),
              Icon(icon, color: TColors.buttonPrimary, size: TSizes.iconSm),
            ],
          ],
        ),
      ),
    );
  }
}
