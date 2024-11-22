import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/common/widgets/loaders/shimmer_loader.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class ClientProfileLoadingScreen extends StatelessWidget {
  const ClientProfileLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShimmerLoader(width: 150.h, height: 150.h),
              // TSizes.spaceBtwInputField.verticalSpace,
              // ShimmerLoader(width: 150.h, height: 30.h),
              TSizes.spaceBtwInputField.verticalSpace,
              ShimmerLoader(width: 150.h, height: 30.h),
              TSizes.spaceBtwInputField.verticalSpace,
              ShimmerLoader(width: 200.h, height: 50.h),
              TSizes.spaceBtwInputField.verticalSpace,
              ShimmerLoader(width: 300.h, height: 50.h),
              TSizes.spaceBtwInputField.verticalSpace,
              SizedBox(
                height: 400.h,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ShimmerLoader(width: double.infinity, height: 40.h),
                  separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
                  itemCount: 7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
