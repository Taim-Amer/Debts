import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/by_sponsor_container.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_debts_row.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_appbar.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_header.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_nav_bar.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ClientProfileNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const ClientProfileAppbar(),
                  TSizes.spaceBtwSections.verticalSpace,
                  const Padding(
                    padding: EdgeInsets.only(top: TSizes.defaultSpace * 3),
                    child: ClientProfileHeader(),
                  ),
                ],
              ),
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
                      Text(TTexts.collectionDate, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.buttonPrimary, fontWeight: FontWeight.w700)),
                      5.verticalSpace,
                      Text("غير محدد", style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.grey, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
              TSizes.spaceBtwSections.verticalSpace,
              Align(alignment: Alignment.topRight, child: Text(TTexts.transactions, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20),)),
              const ClientDebtsRow(),
              const ClientDebtsRow(),
              const ClientDebtsRow(),
              const ClientDebtsRow(),
              const ClientDebtsRow(),
              const ClientDebtsRow(),
            ],
          ),
        ),
      ),
    );
  }
}

