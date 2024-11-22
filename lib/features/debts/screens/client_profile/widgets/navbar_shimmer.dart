import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/loaders/shimmer_loader.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class NavbarShimmer extends StatelessWidget {
  const NavbarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace.w),
      child: Row(
        children: [
          Expanded(child: ShimmerLoader(width: double.infinity, height: 60.h)),
          TSizes.sm.horizontalSpace,
          Expanded(child: ShimmerLoader(width: double.infinity, height: 60.h)),
        ],
      ),
    );
  }
}
