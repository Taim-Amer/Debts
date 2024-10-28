import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/icons/circular_icon.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class HomeEmptyScreen extends StatelessWidget {
  const HomeEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(Icons.notifications, size: TSizes.iconMd, color: TColors.buttonPrimary,),
                  18.horizontalSpace,
                  const Icon(Icons.settings, size: TSizes.iconMd, color: TColors.buttonPrimary,),
                  const Spacer(),
                  Text("اسم المستخدم", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: const Color(0xFF6D6E72)),),
                  8.horizontalSpace,
                  const TCircularIcon(icon: Icons.person, size: TSizes.iconMd, color: Colors.black, backgroundColor: TColors.borderPrimary, width: 36, height: 36,)
                ],
              ),
              100.verticalSpace,
              SvgPicture.asset(TImages.money),
              Text(TTexts.emptyDebts, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: TColors.buttonPrimary)),
              TSizes.spaceBtwSections.verticalSpace,
              SizedBox(width: 315.w, height: 50.h, child: ElevatedButton(onPressed: (){}, child: const Text(TTexts.addDebts)))
            ],
          ),
        ),
      ),
    );
  }
}
