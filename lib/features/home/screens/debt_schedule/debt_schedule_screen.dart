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
      // appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSizes.appbarHeightSpace.verticalSpace,
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
                        const Icon(Icons.person, color: TColors.buttonPrimary,)
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
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(TTexts.clientPhone, style: Theme.of(context).textTheme.titleSmall,),
                        8.horizontalSpace,
                        const Icon(Icons.phone_android, color: TColors.buttonPrimary,)
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  TextFormField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: 'ريف دمشق-ضاحية يوسف العظمة',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                      border: InputBorder.none,
                    ),
                    cursorColor: TColors.buttonPrimary,
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
              TSizes.sm.verticalSpace,
              TextButton(onPressed: (){}, child: const Row(
                children: [
                  Text("إضافة رقم هاتف أخر", style: TextStyle(color: TColors.buttonPrimary),),
                  Icon(Icons.add, size: 20, color: TColors.buttonPrimary,),
                ],
              )),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(TTexts.pageNumber, style: Theme.of(context).textTheme.titleSmall,),
                              8.horizontalSpace,
                              const Icon(Icons.phone_android, color: TColors.buttonPrimary,)
                            ],
                          ),
                        ),
                        12.verticalSpace,
                        TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: 'صفحة رقم : 450',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                            border: InputBorder.none,
                          ),
                          cursorColor: TColors.buttonPrimary,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(TTexts.pageNumber, style: Theme.of(context).textTheme.titleSmall,),
                              8.horizontalSpace,
                              const Icon(Icons.phone_android, color: TColors.buttonPrimary,)
                            ],
                          ),
                        ),
                        12.verticalSpace,
                        TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: 'صفحة رقم : 450',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                            border: InputBorder.none,
                          ),
                          cursorColor: TColors.buttonPrimary,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(TTexts.productDescription, style: Theme.of(context).textTheme.titleSmall,),
                        12.verticalSpace,
                        TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: 'أثاث منزل',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                            border: InputBorder.none,
                          ),
                          cursorColor: TColors.buttonPrimary,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(TTexts.amount, style: Theme.of(context).textTheme.titleSmall,),
                        12.verticalSpace,
                        TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: '1000.000 IQD',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                            border: InputBorder.none,
                          ),
                          cursorColor: TColors.buttonPrimary,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(TTexts.monthlyPayment, style: Theme.of(context).textTheme.titleSmall,),
                        12.verticalSpace,
                        TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: '100.000 IQD',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                            border: InputBorder.none,
                          ),
                          cursorColor: TColors.buttonPrimary,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(TTexts.initialPayment, style: Theme.of(context).textTheme.titleSmall,),
                        12.verticalSpace,
                        TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: '500.000 IQD',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                            border: InputBorder.none,
                          ),
                          cursorColor: TColors.buttonPrimary,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
