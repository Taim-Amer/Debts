import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_debts_row.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final clientProfileModel = ClientProfileController.instance.clientProfileModel.value;
    return ListView.separated(
      itemCount: clientProfileModel.payments?.length ?? 0,
      separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
      itemBuilder: (context, index) => ClientDebtsRow(
        isDebt: clientProfileModel.payments?[index].type == "debt" ? true : false,
        goodsDescription: clientProfileModel.payments?[index].goodsDescription ?? "",
        afterPay: clientProfileModel.payments?[index].afterPay ?? "",
        amount: clientProfileModel.payments?[index].amount ?? "",
        date: clientProfileModel.payments?[index].date ?? "",
      ),
    );
  }
}
