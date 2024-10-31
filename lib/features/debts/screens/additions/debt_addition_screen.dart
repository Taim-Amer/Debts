import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/features/debts/screens/additions/widgets/debt_addition_add_new.dart';
import 'package:taha_debts/features/debts/screens/additions/widgets/debt_addition_navbar.dart';
import 'package:taha_debts/features/debts/screens/additions/widgets/debt_addition_row.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/debts_schedule_appbar.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class DebtAdditionScreen extends StatelessWidget {
  const DebtAdditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: const DebtAdditionNavbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DebtsScheduleAppbar(),
              TSizes.spaceBtwSections.verticalSpace,
              const DebtAdditionRow(),
              TSizes.defaultSpace.verticalSpace,
              const DebtAdditionAddNew()
            ],
          ),
        ),
      ),
    );
  }
}
