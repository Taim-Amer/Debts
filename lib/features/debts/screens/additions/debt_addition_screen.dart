import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/debts/controllers/additions_controller/additions_controller.dart';
import 'package:taha_debts/features/debts/screens/additions/widgets/debt_addition_add_new.dart';
import 'package:taha_debts/features/debts/screens/additions/widgets/debt_addition_navbar.dart';
import 'package:taha_debts/features/debts/screens/additions/widgets/debt_addition_row.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/debts_schedule_appbar.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class DebtAdditionScreen extends StatelessWidget {
  const DebtAdditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() {
        Widget current;
        AdditionsController.instance.addDebtApiStatus.value == RequestState.loading ? current = const LoadingWidget() : current = const DebtAdditionNavbar();
        return current;
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Form(
            key: AdditionsController.instance.debtAdditionsKey,
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
      ),
    );
  }
}
