import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class DebtAdditionScreen extends StatelessWidget {
  const DebtAdditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          width: 400,
          height: 50,
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.redColor,
              foregroundColor: TColors.redColor,
              side: const BorderSide(color: TColors.redColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(TTexts.payment, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white, fontSize: 20),),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackIcon(),
                  Text(TTexts.addDebts, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),),
                  const SizedBox()
                ],
              ),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                children: [
                  const Expanded(flex: 3,child: TextFieldWidget(title: "وصف البضاعة", hint: "وصف تفصيلي عن البضاعة", titleColor: TColors.grey, hintSize: 14, radius: 6,)),
                  8.horizontalSpace,
                  const Expanded(flex: 2,child: TextFieldWidget(title: "المبلغ", hint: "0.00 IQD", titleColor: TColors.grey, hintColor: TColors.redColor, hintSize: 14, radius: 6,)),
                ],
              ),
              TSizes.defaultSpace.verticalSpace,
              Align(
                alignment: Alignment.topRight,
                child: TRoundedContainer(
                  width: 144.w,
                  height: 32.h,
                  backgroundColor: const Color(0xFFBFE3FF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(TTexts.addNewItem, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.buttonPrimary),),
                      const Icon(Icons.add, color: TColors.buttonPrimary)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
