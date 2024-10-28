import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class DebtScheduleScreen extends StatelessWidget {
  const DebtScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackIcon(),
                  Text("اضافة دين جديد", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
                  const SizedBox()
                ],
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(TTexts.clientName, style: Theme.of(context).textTheme.titleSmall,),
                        8.horizontalSpace,
                        const Icon(Icons.email, color: TColors.buttonPrimary,)
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  TextFormField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: 'تيم عامر',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                      border: InputBorder.none,
                    ),
                    cursorColor: TColors.buttonPrimary,
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
              TSizes.spaceBtwInputField.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
