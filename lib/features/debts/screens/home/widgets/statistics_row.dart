import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class StatisticsRow extends StatelessWidget {
  const StatisticsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(TTexts.totalPayment, style: Theme.of(context).textTheme.titleSmall,),
            TSizes.md.verticalSpace,
            Text("0", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.buttonPrimary)),
          ],
        ),
        Container(height: 50.h, width: 1, color: const Color(0xFFC8C8C8)),
        Column(
          children: [
            Text(TTexts.clients, style: Theme.of(context).textTheme.titleSmall,),
            TSizes.md.verticalSpace,
            Text("1", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.buttonPrimary),),
          ],
        ),
        Container(height: 50.h, width: 1, color: const Color(0xFFC8C8C8)),
        Column(
          children: [
            Text(TTexts.totalDebts, style: Theme.of(context).textTheme.titleSmall,),
            TSizes.md.verticalSpace,
            Text("1000.000 IQD", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.redColor),),
          ],
        ),
      ],
    );
  }
}
