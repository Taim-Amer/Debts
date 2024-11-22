import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/borrower_row.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/formatters/formatter.dart';

class BorrowersList extends StatelessWidget {
  const BorrowersList({super.key});

  @override
  Widget build(BuildContext context) {
    final model = HomeController.instance.myDebtsModel.value;
    return SizedBox(
      height: 600.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: TSizes.spaceBtwSections.h),
        child: ListView.separated(
          itemCount: model.debts?.length ?? 0,
          separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
          itemBuilder: (context, index) => BorrowerRow(
            id: model.debts?[index].id ?? 0,
            amount: model.debts?[index].amount.toString() ?? "",
            name: model.debts?[index].name ?? "",
            status: model.debts?[index].status ?? "",
            lastUpdate: model.debts?[index].lastUpdate ?? TFormatter.formatData(null),
          ),
        ),
      ),
    );
  }
}
