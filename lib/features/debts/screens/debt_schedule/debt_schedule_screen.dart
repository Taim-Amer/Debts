import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/fields/animated_text_field_widget.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/add_another_phone_number_button.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/add_new_debt_button.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/add_new_item_button.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/animated_sponsor_address_text_field.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/debts_schedule_appbar.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/models/country_model.dart';

class DebtScheduleScreen extends StatelessWidget {
  const DebtScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: DebtsScheduleAppbar(),),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextFieldWidget(title: TTexts.clientName, hint: "تيم عامر", icon: Icons.person,),
              TSizes.spaceBtwInputField.verticalSpace,
              AnimatedTextFieldWidget(
                title: TTexts.clientAddress,
                icon: Icons.location_on,
                hint: 'ريف دمشق-ضاحية يوسف العظمة',
                listItem: [
                  GlobalModel(title: 'مساكن برزة'),
                  GlobalModel(title: 'جديدة عرطوز'),
                  GlobalModel(title: 'جديدة الفضل'),
                  GlobalModel(title: 'المزة'),
                ],
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              const TextFieldWidget(title: TTexts.clientPhone, hint: "0997421905", icon: Icons.phone_android,),
              TSizes.sm.verticalSpace,
              const AddAnotherPhoneNumberButton(),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: AnimatedTextFieldWidget(
                      title: TTexts.records,
                      hint: "سجل الاثاث",
                      listItem: [
                        GlobalModel(title: 'سجل الأثاث'),
                        GlobalModel(title: 'سجل المفروشات'),
                        GlobalModel(title: 'سجل الكهربائيات'),
                      ],
                    ),
                  ),
                  10.horizontalSpace,
                  const Expanded(
                    flex: 2,
                    child: TextFieldWidget(title: TTexts.pageNumber, hint: "صفحة رقم : 450", icon: Icons.book,),
                  ),
                ],
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              AnimatedSponsorAddressTextField(
                  listItem: [
                    GlobalModel(title: 'مساكن برزة'),
                    GlobalModel(title: 'جديدة عرطوز'),
                    GlobalModel(title: 'جديدة الفضل'),
                    GlobalModel(title: 'المزة'),
                  ],
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: TextFieldWidget(title: TTexts.productDescription, hint: 'أثاث منزل'),
                  ),
                  10.horizontalSpace,
                  const Expanded(
                    flex: 2,
                    child: TextFieldWidget(title: TTexts.amount, hint: '1000.000 IQD'),
                  ),
                ],
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: TextFieldWidget(title: TTexts.monthlyPayment, hint: '100.000 IQD'),
                  ),
                  10.horizontalSpace,
                  const Expanded(
                    flex: 2,
                    child: TextFieldWidget(title: TTexts.initialPayment, hint: '500.000 IQD'),
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
    );
  }
}


