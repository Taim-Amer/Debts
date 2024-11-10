import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/features/debts/controllers/additions_controller/additions_controller.dart';
import 'package:taha_debts/features/debts/screens/additions/widgets/pay_addition_add_new.dart';
import 'package:taha_debts/features/debts/screens/additions/widgets/pay_addition_appbar.dart';
import 'package:taha_debts/features/debts/screens/additions/widgets/pay_addition_navbar.dart';
import 'package:taha_debts/features/debts/screens/additions/widgets/pay_addition_row.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class PayAdditionScreen extends StatelessWidget {
  const PayAdditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const PayAdditionNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Form(
            key: AdditionsController.instance.additionsKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PayAdditionAppbar(),
                TSizes.spaceBtwSections.verticalSpace,
                const PayAdditionRow(),
                TSizes.defaultSpace.verticalSpace,
                const PayAdditionAddNew(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
