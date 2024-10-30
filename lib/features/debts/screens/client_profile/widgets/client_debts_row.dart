import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class ClientDebtsRow extends StatelessWidget {
  const ClientDebtsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSizes.spaceBtwSections.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("500.000 IQD", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.redColor.withOpacity(.8))),
                Text("دين", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.redColor.withOpacity(.8), fontWeight: FontWeight.w400)),
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
                        Text("ساعة 15:00 7/30/2024", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.buttonPrimary)),
                        5.horizontalSpace,
                        const Icon(Icons.calendar_month, color: TColors.buttonPrimary, size: TSizes.iconSm,)
                      ],
                    ),
                    Row(
                      children: [
                        Text("باقي الحساب", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.softGrey, fontWeight: FontWeight.w400)),
                        5.horizontalSpace,
                        Text("500.000 IQD", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.softGrey, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Text("أثاث منزلي", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.softGrey, fontWeight: FontWeight.w400)),
                  ],
                ),
                19.horizontalSpace,
                TCircularContainer(
                  width: 40,
                  height: 40,
                  backgroundColor: TColors.redColor.withOpacity(.2),
                  child: const Icon(Icons.calendar_month, color: TColors.redColor, size: TSizes.iconSm),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
