import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_empty_add_button.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_empty_header.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class HomeEmptyForm extends StatelessWidget {
  const HomeEmptyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              130.verticalSpace,
              const HomeEmptyHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              const HomeAddDebtsButton(),
            ],
          ),
        ),
      ),
    );
  }
}
