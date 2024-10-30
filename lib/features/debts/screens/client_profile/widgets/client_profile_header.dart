import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class ClientProfileHeader extends StatelessWidget {
  const ClientProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(TImages.profile),
        TSizes.xs.verticalSpace,
        Text("تيم عامر: 405", style: Theme.of(context).textTheme.headlineMedium),
        TSizes.sm.verticalSpace,
        Text("0997-421-905", style: Theme.of(context).textTheme.headlineSmall,),
        TSizes.sm.verticalSpace,
        Text("0997-421-905", style: Theme.of(context).textTheme.headlineSmall,),
        TSizes.md.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ريف دمشق-ضاحية يوسف العظمة", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 14),),
            const Icon(Icons.location_on, size: TSizes.iconMd, color: TColors.buttonPrimary,)
          ],
        ),
      ],
    );
  }
}
