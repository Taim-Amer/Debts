import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/app.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){}),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(TTexts.totalPayment, style: Theme.of(context).textTheme.titleSmall,),
                      TSizes.md.verticalSpace,
                      Text("0", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.buttonPrimary)),
                    ],
                  ),
                  Container(height: 50.h, width: 1, color: const Color(0xFFC8C8C8)),
                  Column(
                    children: [
                      Text(TTexts.clients, style: Theme.of(context).textTheme.titleSmall,),
                      TSizes.md.verticalSpace,
                      Text("1", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.buttonPrimary),),
                    ],
                  ),
                  Container(height: 50.h, width: 1, color: const Color(0xFFC8C8C8)),
                  Column(
                    children: [
                      Text(TTexts.totalDebts, style: Theme.of(context).textTheme.titleSmall,),
                      TSizes.md.verticalSpace,
                      Text("1000.000 IQD", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.redColor),),
                    ],
                  ),
                ],
              ),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TRoundedContainer(
                    height: 32.h,
                    padding: const EdgeInsets.all(TSizes.sm),
                    backgroundColor: const Color(0xFFBFE3FF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(TTexts.notations, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.buttonPrimary),),
                        const Icon(Icons.add, color: TColors.buttonPrimary)
                      ],
                    ),
                  ),
                  TRoundedContainer(
                    height: 32.h,
                    padding: const EdgeInsets.all(TSizes.sm),
                    backgroundColor: const Color(0xFFBFE3FF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(TTexts.nonPayers, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.buttonPrimary),),
                        const Icon(Icons.add, color: TColors.buttonPrimary)
                      ],
                    ),
                  ),
                  TRoundedContainer(
                    height: 32.h,
                    padding: const EdgeInsets.all(TSizes.sm),
                    backgroundColor: const Color(0xFFBFE3FF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(TTexts.country, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.buttonPrimary),),
                        const Icon(Icons.add, color: TColors.buttonPrimary)
                      ],
                    ),
                  ),
                  TRoundedContainer(
                    height: 32.h,
                    padding: const EdgeInsets.all(TSizes.sm),
                    backgroundColor: const Color(0xFFBFE3FF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(TTexts.filter, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.buttonPrimary),),
                        const Icon(Icons.add, color: TColors.buttonPrimary)
                      ],
                    ),
                  )
                ],
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              TextFormField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: TTexts.searchByName,
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                  border: InputBorder.none,
                ),
                cursorColor: TColors.buttonPrimary,
                keyboardType: TextInputType.phone,
              ),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          TRoundedContainer(width: 16.w, height: 16.h, radius: 10.r, backgroundColor: TColors.redColor),
                          10.horizontalSpace,
                          Text("تيم عامر 450", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14)),
                        ],
                      ),
                      Text(TTexts.day, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: TColors.redColor),)
                    ],
                  ),
                  19.horizontalSpace,
                  TCircularContainer(
                    width: 34,
                    height: 34,
                    backgroundColor: TColors.lightGrey,
                    child: Text("ت", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
