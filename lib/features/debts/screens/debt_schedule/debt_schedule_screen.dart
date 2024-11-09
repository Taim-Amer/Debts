import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/fields/animated_text_field_widget.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/features/debts/repositories/debt_schedule/debt_schedule_repo_impl.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/add_another_phone_number_button.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/add_new_debt_button.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/add_new_item_button.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/address_sponsor_animated_container.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/animated_sponsor_address_text_field.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/debts_schedule_appbar.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/address_client_animated_container.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/goods_record_animated_container.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/models/country_model.dart';
import 'package:taha_debts/utils/validators/validation.dart';

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
                TextFieldWidget(
                  title: TTexts.clientName,
                  hint: "تيم عامر",
                  icon: Icons.person,
                  controller: DebtScheduleController.instance.clientNameController,
                  validator: (value) => TValidator.validateEmptyText("اسم العميل", value),
                  keyboardType: TextInputType.name,
                ),
                TSizes.spaceBtwSections.verticalSpace,
                const AddressClientAnimatedContainer(
                  title: TTexts.clientAddress,
                  icon: Icons.location_on,
                  hint: 'دمشق',
                ),
                TSizes.spaceBtwInputField.verticalSpace,
                TextFieldWidget(
                  title: TTexts.clientPhone,
                  hint: "000-000-000",
                  icon: Icons.phone_android,
                  controller: DebtScheduleController.instance.clientNumberController,
                  validator: (value) => TValidator.validatePhoneNumber(value),
                ),
                TSizes.sm.verticalSpace,
                const AddAnotherPhoneNumberButton(),
                TSizes.sm.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 3,
                      child: GoodsRecordAnimatedContainer(title: TTexts.records, hint: "سجل الاثاث",)),
                    10.horizontalSpace,
                    Expanded(
                      flex: 2,
                      child: TextFieldWidget(
                        title: TTexts.pageNumber,
                        hint: "صفحة رقم : 450",
                        icon: Icons.book,
                        controller: DebtScheduleController.instance.pageNumberController,
                        validator: (value) => TValidator.validateEmptyText("رقم الصفحة", value),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                TSizes.spaceBtwInputField.verticalSpace,
                const AnimatedSponsorAddressTextField(),
                TSizes.spaceBtwInputField.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFieldWidget(
                        title: TTexts.productDescription,
                        hint: 'أثاث منزل',
                        controller: DebtScheduleController.instance.goodsDescriptionController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      flex: 2,
                      child: TextFieldWidget(
                        title: TTexts.amount,
                        hint: '1000.000 IQD',
                        controller: DebtScheduleController.instance.amountController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                TSizes.spaceBtwInputField.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFieldWidget(
                        title: TTexts.monthlyPayment,
                        hint: '100.000 IQD',
                        controller: DebtScheduleController.instance.monthlyPaymentController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      flex: 2,
                      child: TextFieldWidget(
                        title: TTexts.initialPayment,
                        hint: '500.000 IQD',
                        controller: DebtScheduleController.instance.monthlyPaymentController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                TSizes.spaceBtwSections.verticalSpace,
                const Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: AddNewItemButton(),
                ),
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


