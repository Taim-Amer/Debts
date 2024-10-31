import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/features/notations/screens/widgets/notation_appbar.dart';
import 'package:taha_debts/features/notations/screens/widgets/notation_item.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class NotationsScreen extends StatelessWidget {
  const NotationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const NotationAppbar(),
              TSizes.spaceBtwSections.verticalSpace,
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
              const NotationItem(),
            ],
          ),
        ),
      ),
    );
  }
}
