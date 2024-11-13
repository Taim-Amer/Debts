import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_debts_row.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/device/device_utility.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final clientProfileModel = ClientProfileController.instance.clientProfileModel.value;
    return SizedBox(
      height: TDeviceUtils.getScreenHeight() - kToolbarHeight,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: clientProfileModel.payments?.length ?? 0,
        separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => ClientDebtsRow(
          isDebt: clientProfileModel.payments?[index].type == "debt" ? true : false,
          goodsDescription: clientProfileModel.payments?[index].goodsDescription.toString() ?? "",
          afterPay: clientProfileModel.payments?[index].afterPay.toString() ?? "",
          amount: clientProfileModel.payments?[index].amount.toString() ?? "",
          date: clientProfileModel.payments?[index].date.toString() ?? "",
        ),
      ),
    );
  }
}
