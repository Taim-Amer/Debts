import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class StatisticsRow extends StatelessWidget {
  const StatisticsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(TAppTranslations.kTotalDebtors, style: Theme.of(context).textTheme.titleSmall,),
            TSizes.md.verticalSpace,
            Text(HomeController.instance.myDebtsModel.value.data?.totalAmount.toString() ?? "0", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.redColor),),
          ],
        ),
        Container(height: 50.h, width: 1, color: const Color(0xFFC8C8C8)),
        Column(
          children: [
            Text(TAppTranslations.kClients, style: Theme.of(context).textTheme.titleSmall,),
            TSizes.md.verticalSpace,
            Text(HomeController.instance.myDebtsModel.value.data?.totalCount.toString() ?? "1", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.buttonPrimary),),
          ],
        ),
        Container(height: 50.h, width: 1, color: const Color(0xFFC8C8C8)),
        Column(
          children: [
            // Text(TArabicTexts.totalPayment, style: Theme.of(context).textTheme.titleSmall,),
            Text(TAppTranslations.kTotalPayment, style: Theme.of(context).textTheme.titleSmall,),
            TSizes.md.verticalSpace,
            Text(HomeController.instance.myDebtsModel.value.data?.totalPayment.toString() ?? "0", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.buttonPrimary)),
          ],
        ),
      ],
    );
  }
}
