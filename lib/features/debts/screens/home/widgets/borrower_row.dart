import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class BorrowerRow extends StatelessWidget {
  const BorrowerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("500.000 IQD", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.redColor)),
            Text(TTexts.debt, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.softGrey, fontWeight: FontWeight.w400)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    TRoundedContainer(width: 16.w, height: 16.h, radius: 10.r, backgroundColor: TColors.redColor),
                    10.horizontalSpace,
                    Text("تيم عامر 450", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14)),
                  ],
                ),
                Row(
                  children: [
                    Text(TTexts.day, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.softGrey, fontWeight: FontWeight.w400)),
                    const Icon(Icons.calendar_month, color: TColors.softGrey, size: 12,)
                  ],
                )
              ],
            ),
            19.horizontalSpace,
            TCircularContainer(
              width: 34,
              height: 34,
              backgroundColor: TColors.lightGrey,
              child: Text("ت", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),),
            ),
          ],
        ),
      ],
    );
  }
}