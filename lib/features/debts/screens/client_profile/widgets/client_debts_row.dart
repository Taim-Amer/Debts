import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class ClientDebtsRow extends StatelessWidget {
  const ClientDebtsRow({super.key, required this.isDebt, required this.goodsDescription, required this.afterPay, required this.amount, required this.date});

  final bool isDebt;
  final String goodsDescription;
  final String afterPay;
  final String amount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TCircularContainer(
                  width: 40,
                  height: 40,
                  backgroundColor: isDebt ? TColors.redColor.withOpacity(.2) : TColors.greenColor.withOpacity(.2),
                  child: isDebt ? SvgPicture.asset(TImages.up) : SvgPicture.asset(TImages.down),
                ),
                19.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: TColors.buttonPrimary, size: TSizes.iconSm,),
                        5.horizontalSpace,

                        Text("ساعة $date", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.buttonPrimary)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(afterPay.toString(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.softGrey, fontWeight: FontWeight.w400)),
                        5.horizontalSpace,
                        Text(TranslationKey.kRestAccount, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.softGrey, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Text(goodsDescription, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.softGrey, fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(amount.toString(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: isDebt ? TColors.redColor.withOpacity(.8) : TColors.greenColor.withOpacity(.8))),
                Text(isDebt ? "دين" : "قبضت", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: isDebt ? TColors.redColor.withOpacity(.8) : TColors.greenColor.withOpacity(.8), fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
