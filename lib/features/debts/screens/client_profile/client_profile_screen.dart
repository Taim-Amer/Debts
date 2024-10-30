import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taha_debts/app.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/by_sponsor_container.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_debts_row.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_appbar.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_header.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ClientProfileAppbar(),
              TSizes.spaceBtwSections.verticalSpace,
              const ClientProfileHeader(),

              TSizes.md.verticalSpace,
              const BySponsorContainer(),
              TSizes.md.verticalSpace,
              TRoundedContainer(
                borderColor: TColors.grey,
                showBorder: true,
                backgroundColor: Colors.transparent,
                radius: 30.r,
                width: 270.h,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.sm),
                  child: Column(
                    children: [
                      Text("تاريخ التحصيل", style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.buttonPrimary, fontWeight: FontWeight.w700)),
                      5.verticalSpace,
                      Text("غير محدد", style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.grey, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
              TSizes.spaceBtwSections.verticalSpace,
              Align(alignment: Alignment.topRight, child: Text(":المعاملات", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20),)),
              const ClientDebtsRow(),
              const ClientDebtsRow(),
              const ClientDebtsRow(),
              const ClientDebtsRow(),
              const ClientDebtsRow(),
              const ClientDebtsRow(),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: SizedBox(height: 50.h, child: OutlinedButton(onPressed: (){}, child: Text("شراء", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.redColor))))),
                  15.horizontalSpace,
                  Expanded(
                    child: SizedBox(
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: TColors.greenColor,
                          backgroundColor: TColors.greenColor,
                          side: const BorderSide(color: TColors.greenColor, width: 2),
                        ),
                        child: Text("تسديد", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

