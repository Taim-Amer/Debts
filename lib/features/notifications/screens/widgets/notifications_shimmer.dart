import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/loaders/shimmer_loader.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class NotificationsShimmer extends StatelessWidget {
  const NotificationsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const ShimmerLoader(width: double.infinity, height: 60),
            TSizes.spaceBtwItems.verticalSpace,
            const ShimmerLoader(width: double.infinity, height: 60),
            TSizes.spaceBtwItems.verticalSpace,
            const ShimmerLoader(width: double.infinity, height: 60),
            TSizes.spaceBtwItems.verticalSpace,
            const ShimmerLoader(width: double.infinity, height: 60),
            TSizes.spaceBtwItems.verticalSpace,
            const ShimmerLoader(width: double.infinity, height: 60),
            TSizes.spaceBtwItems.verticalSpace,
            const ShimmerLoader(width: double.infinity, height: 60),
            TSizes.spaceBtwItems.verticalSpace,
            const ShimmerLoader(width: double.infinity, height: 60),
            TSizes.spaceBtwItems.verticalSpace,
            const ShimmerLoader(width: double.infinity, height: 60),
            TSizes.spaceBtwItems.verticalSpace,
            const ShimmerLoader(width: double.infinity, height: 60),
            TSizes.spaceBtwItems.verticalSpace,
            const ShimmerLoader(width: double.infinity, height: 60),
            TSizes.spaceBtwItems.verticalSpace,
            const ShimmerLoader(width: double.infinity, height: 60),
            // TSizes.spaceBtwItems.verticalSpace,
          ],
        ),
      ),
    );
  }
}
