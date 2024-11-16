import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/add_another_phone_number_button.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/add_new_debt_button.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/add_new_item_button.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/amount_textfield.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/animated_sponsor_address_text_field.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/another_number_animated_textfield.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/client_name_textfield.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/client_phone_textfield.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/debts_schedule_appbar.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/address_client_animated_container.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/goods_description_textfield.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/goods_record_animated_container.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/initial_payment_textfield.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/monthly_payment_textfield.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/page_number_textfield.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class DebtScheduleScreen extends StatelessWidget {
  const DebtScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: DebtScheduleController.instance.debtScheduleKey,
      child: Scaffold(
        appBar: const TAppBar(title: DebtsScheduleAppbar(),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ClientNameTextField(),
                TSizes.lg.verticalSpace,
                const AddressClientAnimatedContainer(),
                TSizes.sm.verticalSpace,
                const ClientPhoneTextField(),
                TSizes.sm.verticalSpace,
                const AnotherNumberAnimatedTextfield(),
                TSizes.sm.verticalSpace,
                const AddAnotherPhoneNumberButton(),
                TSizes.sm.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: PageNumberTextField(),
                    ),
                    10.horizontalSpace,
                    const Expanded(
                      flex: 3,
                      child: GoodsRecordAnimatedContainer(),
                    ),
                  ],
                ),
                TSizes.spaceBtwInputField.verticalSpace,
                const AnimatedSponsorAddressTextField(),
                TSizes.spaceBtwInputField.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: AmountTextField(),
                    ),
                    10.horizontalSpace,
                    const Expanded(
                      flex: 3,
                      child: GoodsDescriptionTextField(),
                    ),
                  ],
                ),
                TSizes.spaceBtwInputField.verticalSpace,
                Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: InitialPaymentTextField(),
                    ),
                    10.horizontalSpace,

                    const Expanded(
                      flex: 3,
                      child: MonthlyPaymentTextField(),
                    ),
                  ],
                ),
                TSizes.spaceBtwSections.verticalSpace,
                const AddNewItemButton(),
                TSizes.spaceBtwSections.verticalSpace,
                const AddNewDebtButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}