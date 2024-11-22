import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/loaders/shimmer_loader.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class HomeLoadingScreen extends StatelessWidget {
  const HomeLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            ShimmerLoader(width: double.infinity, height: 100.h),
            TSizes.spaceBtwInputField.verticalSpace,
            Row(
              children: [
                Expanded(child: ShimmerLoader(width: double.infinity, height: 35.h)),
                TSizes.xs.horizontalSpace,
                Expanded(child: ShimmerLoader(width: double.infinity, height: 35.h)),
                TSizes.xs.horizontalSpace,
                Expanded(child: ShimmerLoader(width: double.infinity, height: 35.h)),
                TSizes.xs.horizontalSpace,
                Expanded(child: ShimmerLoader(width: double.infinity, height: 35.h)),
              ],
            ),
            TSizes.spaceBtwInputField.verticalSpace,
            SizedBox(
              height: 600.h,
              child: ListView.separated(
                itemBuilder: (context, index) => ShimmerLoader(width: double.infinity, height: 40.h),
                separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
                itemCount: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
