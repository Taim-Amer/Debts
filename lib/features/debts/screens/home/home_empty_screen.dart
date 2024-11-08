import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_empty_add_button.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_empty_appbar.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_empty_header.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class HomeEmptyScreen extends StatelessWidget {
  const HomeEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: HomeAppbar(),),
      body: SingleChildScrollView(
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
      ),
    );
  }
}






